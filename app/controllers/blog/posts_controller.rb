class Blog::PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])
  end
end