class Web::SessionsController < Web::ApplicationController

  before_filter :redirect_if_user_is_authorized, except: [:destroy]

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
      sign_in(user.id)
      redirect_to root_url
    else
      flash[:error] = "Invalid email or password"
      @user = User.new
      render "new"
    end
  end

  def destroy
    sign_out
  end

end
