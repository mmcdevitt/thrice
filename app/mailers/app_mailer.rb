class AppMailer < ActionMailer::Base
  def notify_on_new_order(user, order)
    @order = order
    mail from: 'info@thrice.io', to: user.email, subject: 'Your item has been sold.'
  end

  def notify_buyer(user, order)
    @order = order
    mail from: 'info@thrice.io', to: user.email, subject: 'Your item has been sold.'
  end
end