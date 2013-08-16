class UserMailer < BaseMailer

  def signup_notify(user)
    @user = user
    mail(to: user.email)
  end

end