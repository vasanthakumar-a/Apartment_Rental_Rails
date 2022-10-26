class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticated_user_or_owner?
    user_signed_in? or owner_signed_in?
  end
  
  protected 

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phonenumber, :credits, :password, :profile_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phonenumber, :credits, :password, :remember_me, :profile_image])
  end
end