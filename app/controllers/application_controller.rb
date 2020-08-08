class ApplicationController < ActionController::Base
  # CSRF対策
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # login後、root_pathに移動する
  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    signup_keys = [:nick_name, :email]
    update_keys = signup_keys + [:name, :address, :image, :territory, :bio]

    # signup時のstrong_parameterを渡す
    devise_parameter_sanitizer.permit(:sign_up, keys: signup_keys)

    # update時のstrong_parameterを渡す
    devise_parameter_sanitizer.permit(:account_update, keys: update_keys)
  end
end