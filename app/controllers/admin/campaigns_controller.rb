# frozen_string_literal: true

class Admin::CampaignsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @campaigns = Campaign.all
  end

  def update
    campaign = Campaign.find(params[:id])
    if params[:featured].present? && campaign.update_featured_status(params[:featured])
      html = render_to_string('_campaign_table_row',
                              formats: :html,
                              layout: false,
                              locals: { campaign: campaign })
      message = if campaign.featured?
                  "Updated #{campaign.title} to a featured campaign"
                else
                  "Removed fetured campaign status from #{campaign.title}"
                end
      render json: { message: message, html: html }
    end
  end
end
