module Concerns
  module Authorization

    def current_user
      session_user = User.where(id: session[:user_id]).first
      if session[:user_id] && session_user.present?
        @current_user ||= session_user
      else
        sign_out
      end
    end

    def signed_in?
      current_user.present?
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
    end

  end
end