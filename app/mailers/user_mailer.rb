class UserMailer < BaseMailer

  def send_welcome_email(user)
    @user = user
    mail(to: user.email)
  end

end