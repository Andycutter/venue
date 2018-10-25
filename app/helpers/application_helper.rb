module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_order?
    session[:order_id]
  end

  def active_order
    Order.find(session[:order_id])
  end

  def select_genre_options
    Genre.all.order("id ASC").collect { |g| [g.name.humanize, g.id] }
  end

  def select_performers_options
    Performer.all.order("id ASC").collect { |g| [g.name, g.id] }
  end
end
