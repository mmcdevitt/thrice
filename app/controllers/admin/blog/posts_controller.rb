module Admin
  module Blog
    class PostsController < AdminsController
      before_action :set_post, only: [:show, :edit, :update, :destroy]

      def index
        @posts = Post.all
      end

      def show
      end

      def edit
      end

      def update
        if @post.update(posts_params)
          flash[:success] = "Post updated."
          redirect_to admin_blog_posts_path
        else
          render 'edit'
        end
      end

      def new
        @post = current_user.posts.new
      end

      def create
        @post = current_user.posts.new(posts_params)
        if @post.save
          flash[:success] = "Post saved."
          redirect_to admin_blog_posts_path
        else
          render 'new'
        end
      end

      def destroy
        @post.destroy
        flash[:success] = "Post was deleted."
        redirect_to :back
      end

      private
      def posts_params
        params.require(:post).permit(:title, :content, :user_id, :post_image)
      end

      def set_post
        @post = Post.find(params[:id])
      end

    end
  end
end