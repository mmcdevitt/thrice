class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  layout :admin_layout

  private

  def admin_layout
    'admin'
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:danger] = 'You do not have access to this area!'
      redirect_to root_path
    end
  end
end