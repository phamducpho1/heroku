class UserMailer < ApplicationMailer
  def mailer_order user
    @user = user
    @id = User.find_by id: @user.user_id
    @mail = User.send_mail
    emails = @mail.collect(&:email).join(",")
    mail to: emails, subject: t("mail_oder")
  end
end
