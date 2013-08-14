class UsersController < ApplicationController
  before_filter :redirect_if_user_is_authorized

  def create
    @user = UserSignUpType.new(params[:user])
    if @user.save && @user.authenticate(params[:user][:password])
      sign_in(@user.id)
      redirect_to root_path
    else
      render new_session_path
    end
  end

end
