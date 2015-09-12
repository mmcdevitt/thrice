class CategoriesController < ApplicationController
  def show 
    @category = Category.find_by_title(params[:title])
    @listings = @category.listings.all
  end
end