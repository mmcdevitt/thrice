class ProfilesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def show
    @user = User.find_by_username(params[:username])
    @listings = @user.listings.active.decorate
    @relationship = Relationship.where(following_id: @user, follower_id: current_user).first
    # @relationship = @user.relationships.where(follower_id: current_user).last
    add_breadcrumb @user.username, ''
  end
end
