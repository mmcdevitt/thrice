class ProfilesController < ApplicationController
  before_action :authenticate_user!
  add_breadcrumb "Home", :root_path

  def show
    @user = User.find_by_username(params[:username])
    @listings = @user.listings.active.decorate
    add_breadcrumb @user.username, ''
  end
end
