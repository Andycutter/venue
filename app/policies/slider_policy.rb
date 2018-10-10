class SliderPolicy < ApplicationPolicy

  def create?
    user.admin?
  end

  def update?
    create?
  end 
end
