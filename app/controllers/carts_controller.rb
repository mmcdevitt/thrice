class CartsController < ApplicationController
  def show
    @order_items = current_cart.order_items
    @current_cart = current_cart
  end
end
