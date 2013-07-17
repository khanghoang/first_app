class ApplicationController < ActionController::Base
  # define constant
  ITEMS_PER_VIEW = 7
  protect_from_forgery  
  include SessionsHelper
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def handle_view_more_ajax(relations)
  	relations.limit(ITEMS_PER_VIEW).offset(params[:page].to_i * ITEMS_PER_VIEW)
  end

end
