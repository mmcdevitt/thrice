class RegistrationsController < Devise::RegistrationsController
  add_breadcrumb 'Home', :root_path

  def new
    super
  end

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def edit
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      AppMailer.notify_on_new_user(@user).deliver
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :first_name, :last_name, :shipping_address, :city, :state, :zipcode)
  end

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      params[:user][:password].present?
  end

  def after_update_path_for(resource)
    profile_edit_path
  end
end