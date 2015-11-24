class RatingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(ratings_params)
    @rating.buyer_id = current_user.id
    @rating.save
  end

  private
  def ratings_params
    params.require(:rating).permit(:buyer_id, :seller_id, :comment)
  end

end
