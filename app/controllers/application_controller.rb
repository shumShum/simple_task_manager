class ApplicationController < ActionController::Base
  include Concerns::Authorization
  include Concerns::FlashHelper

  protect_from_forgery

  helper_method :current_user

end
