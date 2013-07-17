class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = handle_view_more_ajax(current_user.feed)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def help

  end

  def about
  	
  end
  
  def contact
  	
  end
end
