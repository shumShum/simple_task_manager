class Web::SessionsController < Web::ApplicationController

  before_filter :redirect_if_user_is_authorized, except: [:destroy]

  def new

  end

  def create
    @session = UserSignInType.new(params[:session])

    if @session.valid?
      user = @session.user
      sign_in(user)
      redirect_to root_url
    else
      f(:error)
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

end
