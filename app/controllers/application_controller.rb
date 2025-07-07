class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
    # Allow extra params for sign_up
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])

    # Allow extra params for account_update
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])

    # Optional: for sign_in if using custom fields
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  # end
end
