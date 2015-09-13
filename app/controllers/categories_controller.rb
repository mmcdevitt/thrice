class CategoriesController < ApplicationController
  def show 
    @category = Category.find_by_title(params[:title])
    @listings = @category.listings.all
    @order_item = current_cart.order_items.new
  end
end