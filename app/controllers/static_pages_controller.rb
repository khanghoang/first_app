class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.limit_offset(params[:page].to_i)
      respond_to do |format|
        format.html
        format.js {render "#{AJAX_VIEWS_FOLDER}/feed"}
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
