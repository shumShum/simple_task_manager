class Web::SessionsController < Web::ApplicationController

  before_filter :redirect_if_user_is_authorized, except: [:destroy]

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_url
    else
      f(:error)
      @user = User.new
      render "new"
    end
  end

  def destroy
    sign_out
  end

end
