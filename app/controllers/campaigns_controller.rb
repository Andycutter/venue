class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :get_campaign, only: [:show, :edit, :update]

  def index
    if user_signed_in? && current_user.admin?
      @campaigns = Campaign.all
    else
      @campaigns = Campaign.with_state(:accepted)
    end
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @campaign = current_user.campaigns.create(campaign_params)
    if @campaign.persisted?
      ticket = @campaign.tickets.create(ticket_params) 
      ticket_variants.each {|values| TicketVariant.create(values.merge(ticket: ticket))}
      flash[:notice] = 'Campaign successfully launched'
      redirect_to campaign_path(@campaign)
    else
      render json: {message: 'Additional input required'}, status: 422
      authorize @campaign
    end
  end

  def show
  end

  def edit
    authorize @campaign
  end

  def update
    if params[:event] == 'accept'
      @campaign.accept
      redirect_to @campaign, notice: 'This campaign is now live!'
    elsif
      params[:event] == 'archive'
      @campaign.archive
      redirect_to campaigns_path, notice: 'Campaign has been archived'
    else
      @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign), notice: 'Campaign has been successfully updated'
      authorize @campaign
    end
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :location, :image, :state, :event_date, genre_ids: [])
  end

  def ticket_params 
    params[:campaign][:ticket].permit(:price)
  end

  def ticket_variants
    params[:campaign][:ticket_variants].permit!.to_h.symbolize_keys.values 
  end

  def get_campaign
    @campaign = Campaign.find(params[:id])
  end
end
