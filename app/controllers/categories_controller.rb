class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def show
    @category = Category.find_by_title(params[:title])
    @listings = @category.listings.all
    @order_item = current_cart.order_items.new

    add_breadcrumb @category.title.capitalize, @category.title
  end

end