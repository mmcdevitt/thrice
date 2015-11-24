class Blog::PostsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb 'Blog', '/'

  def show
    @post = Post.friendly.find(params[:id])

    add_breadcrumb @post.title, '/'
  end
end