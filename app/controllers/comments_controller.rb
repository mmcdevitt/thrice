class CommentsController < ApplicationController

  def create
    @listing = Listing.friendly.find(params[:listing_id])
    @comment = @listing.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      render 'listing/show'
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content, :listing_id, :user_id)
  end

end
# asdfasdf