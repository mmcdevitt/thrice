class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
  end
end
