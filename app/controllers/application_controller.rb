class ApplicationController < ActionController::Base
  before_action :get_slider_content
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    if session[:ticket_id]
      ticket_variant = TicketVariant.find(session[:ticket_id])

      order = Order.find_or_create_by(id: session[:order_id]) do |new_order|
        new_order.user = current_user
      end
      session[:order_id] = order.id
      message = OrdersService.add_ticket_to_order(ticket_variant, order)
      session.delete(:ticket_id)
      flash[:success] = "Your ticket has been added to your order."
      campaign_path(ticket_variant.ticket.campaign)
    else
      super
    end
  end

  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :access_denied

  private

  def access_denied
    redirect_to root_path, notice: 'Access denied'
  end

  def get_slider_content
    @slides = Slider.visible
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
