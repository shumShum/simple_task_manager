class Web::UsersController < Web::ApplicationController
  before_filter :redirect_if_user_is_authorized

  def new
    @user = UserSignUpType.new
  end

  def create
    @user = UserSignUpType.new(params[:user])
    if @user.save && @user.authenticate(params[:user][:password])
      UserMailer.signup_notify(@user).deliver
      sign_in(@user.id)
      redirect_to root_path
    else
      render new_session_path
    end
  end

end
