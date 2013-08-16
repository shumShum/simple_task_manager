class ApplicationController < ActionController::Base
  include Authorization
  include FlashHelper

  protect_from_forgery

  helper_method :current_user

end
