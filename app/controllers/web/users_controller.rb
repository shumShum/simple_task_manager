class Web::UsersController < Web::ApplicationController
  before_filter :redirect_if_user_is_authorized

  def new
    @user = UserSignUpType.new
  end

  def create
    @user = UserSignUpType.new(params[:user])
    if @user.save && @user.authenticate(params[:user][:password])
      UserMailer.send_welcome_email(@user).deliver
      sign_in(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end

end
