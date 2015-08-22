class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
