class CartsController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def show
    @order_items = current_cart.order_items
    @current_cart = current_cart
    add_breadcrumb 'Shopping Cart', ''
  end
end
