class ApplicationController < ActionController::Base
  include Authorization

  protect_from_forgery

  helper_method :current_user
  
end
