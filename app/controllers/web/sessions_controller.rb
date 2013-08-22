class Web::SessionsController < Web::ApplicationController

  before_filter :redirect_if_user_is_authorized, except: [:destroy]

  def new

  end

  def create
    type = UserSignInType.new(params[:session])
    user = User.find_by_email(params[:session][:email])
    if type.valid? && user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_url
    else
      f(:error)
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

end
