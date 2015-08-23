class HomePagesController < ApplicationController
  layout :layout
  
  def index
    @listings = Listing.not_sold
    @order_item = current_cart.order_items.new
  end

  private

  def layout
    'home_page'
  end
end
