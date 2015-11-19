class AppMailer < ActionMailer::Base
  def notify_on_new_order(user, order)
    @order = order
    mail from: 'info@thrice.io', to: user.email, subject: 'Your item has been sold.'
  end

  def notify_buyer(user, order)
    @order = order
    mail from: 'info@thrice.io', to: user.email, subject: 'Your item has been sold.'
  end

  def notify_on_new_user(user)
    @user = user
    mail from: 'Thrice Clothing', to: 'mmcdevi1@gmail.com, mmcdevitt@eastgate.io', subject: 'Thrice has a new user.'
  end
end