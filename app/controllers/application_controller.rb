class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_photo
    devise_parameter_sanitizer.for(:account_update) << :profile_photo
  end

  protect_from_forgery with: :exception

  def authorize!
    if current_user.nil? || !current_user.is_admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
