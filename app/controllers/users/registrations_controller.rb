class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(user_params)
    if @user.save
      AppMailer.notify_on_new_user.deliver
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end