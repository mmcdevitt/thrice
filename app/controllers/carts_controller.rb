class CartsController < ApplicationController
  before_action :authenticate_user!
  add_breadcrumb 'Home', :root_path

  def show
    @order_items = current_cart.order_items.decorate
    @current_cart = current_cart
    add_breadcrumb 'Shopping Cart', ''
  end
end
