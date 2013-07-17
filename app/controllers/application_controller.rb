class ApplicationController < ActionController::Base
  # define constant
  ITEMS_PER_VIEW = 5
  protect_from_forgery  
  include SessionsHelper
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end
