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
    devise_keys = [:name, :user_name, :address, :image, :back_image, :territory, :bio]

    # signup時のstrong_parameterを渡す
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])

    # update時のstrong_parameterを渡す
    devise_parameter_sanitizer.permit(:account_update, keys: devise_keys)
  end
end