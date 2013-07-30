class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end
  helper_method :current_user

  def to_signin
    redirect_to new_session_path unless current_user.present?  
  end

  def to_root
    redirect_to root_path if current_user.present?
  end

  def save_users_session(user_id)
    session[:user_id] = user_id
  end
  
end
