class Admin::UsersController < AdminsController
  def index
    @users = User.all
  end
end