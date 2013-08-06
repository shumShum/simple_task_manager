class UsersController < ApplicationController

  before_filter :redirect_if_user_is_authorized

  def create
    @user = User.new(params[:user])
    if @user.save && @user.authenticate(params[:user][:password])
      save_users_session(@user.id)
      redirect_to root_path
    else
      render new_session_path
    end
  end

end
