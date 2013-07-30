class SessionsController < ApplicationController

  before_filter :to_root, except: [:destroy]

  def new
    if current_user.present?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      save_users_session(user.id)
      redirect_to root_url
    else
      flash[:error] = "Invalid email or password"
      @user = User.new
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
