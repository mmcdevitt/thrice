class RatingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @orders = Order.all.where(buyer: current_user).order("created_at DESC").decorate
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(ratings_params)
    @rating.buyer_id = current_user.id
    if @rating.save
      redirect_to :back
    end
  end

  private
  def ratings_params
    params.require(:rating).permit(:buyer_id, :seller_id, :comment, :feedback_value, :listing_id)
  end

end
