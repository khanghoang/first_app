class ApplicationController < ActionController::Base
  # define constant
  AJAX_VIEWS_FOLDER = "ajax_views"
  protect_from_forgery  
  include SessionsHelper
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
