# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    @user = User.from_omniauth(request.env['omniauth.auth'])
    params = request.env['omniauth.params']
    if @user.persisted?
      @user.update_attribute(:role, params['role']) if params['role']
      sign_in_and_redirect @user, event: :authentication
      set_flash_message!(:welcome, :success, kind: __callee__.to_s.split('_').first.titleize) if is_navigational_format?
    else
      session["devise.#{__callee__.to_s.split('_').first}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_path
    end
  end
  %i[facebook google_oauth2].each do |provider|
    alias_method provider, :all
  end

  def failure
    redirect_to root_path, notice: 'Could not authenticate you!'
  end
end
