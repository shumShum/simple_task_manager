class UserMailer < BaseMailer

  def send_welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to simple task manager')
  end

end