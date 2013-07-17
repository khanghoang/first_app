class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.limit(5).offset(params[:page].to_i*5)
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
