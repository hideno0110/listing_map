class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # add for require update parameters 
  # https://github.com/plataformatec/devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email,:phone_number,:description])
  end
  
  #end
end
