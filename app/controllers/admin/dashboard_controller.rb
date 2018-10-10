class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  def index
    authorize :dashboard, :index? 
  end
end
