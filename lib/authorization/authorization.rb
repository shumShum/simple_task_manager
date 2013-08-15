module Authorization

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def redirect_if_user_is_not_authorized
    redirect_to new_session_path unless signed_in?
  end

  def redirect_if_user_is_authorized
    redirect_to root_path if signed_in?
  end

  def sign_in(user_id)
    session[:user_id] = user_id
  end

  def sign_out
    session[:user_id] = nil
    redirect_to new_session_path
  end

end