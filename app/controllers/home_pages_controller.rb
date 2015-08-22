class HomePagesController < ApplicationController
  layout :layout
  
  def index
    @listings = Listing.all
    @order_item = current_order.order_items.new
  end

  private

  def layout
    'home_page'
  end
end
