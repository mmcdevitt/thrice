class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def show
    # @filterrific = Filterrific.new(Category, params[:filterrific])
    # @filterrific.select_options = {
    #   sorted_by: Category.options_for_sorted_by,
    #   with_size: Category.options_for_select
    # }
    @category = Category.find_by_title(params[:title])
    # @categories = Category.filterrific_find(@filterrific).page(params[:page]).with_size
    @listings = @category.listings.all.decorate
    @order_item = current_cart.order_items.new

    add_breadcrumb @category.title.capitalize, @category.title
  end

end