class DashboardPolicy < Struct.new(:user, :dashboard)

  # We don't have a resourse for Dashboard
  # so we only want the user to be defined
  def initialize(user, resource)
    @user = user
  end

  def index?
    @user.admin?
  end
end