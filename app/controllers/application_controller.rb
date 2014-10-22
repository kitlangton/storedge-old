class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    # Only add some parameters
    devise_parameter_sanitizer.for(:invite).concat [:email, :first_name, :last_name, :company_id]
    # Override accepted parameters
    devise_parameter_sanitizer.for(:invite) do |u|
      u.permit(:email, :first_name, :last_name, :company_id, :password, :password_confirmation,
               :invitation_token)
    end
  end
end
