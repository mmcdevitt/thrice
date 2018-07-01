class ApplicationController < ActionController::Base
  include DeviseHelper

  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  THRICE_FEE = 0.95

  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new
    end
  end
end




