class UserMailerPreview < ActionMailer::Preview
  def mailer_order
    user = Order.last
    UserMailer.mailer_order user
  end
end
