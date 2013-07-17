class UsersController < ApplicationController
    before_filter :signed_in_user, except: [:show, :new, :create]
    before_filter :admin_user,  only: :destroy
    before_filter :new_user, only: [:new, :create] 
    
	  def show
    	@user = User.find_by_id(params[:id])
      if !@user.nil?
        @microposts = handle_view_more_ajax(@user.microposts)
        respond_to do |format|
          format.html
          format.js
        end
      else
        redirect_to(root_path)
      end
  	end

  	def new
  		@user = User.new
  	end

  	def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user      
      else
        render 'new'
      end
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update_attributes(params[:user])
        #successfull update
        sign_in @user
        flash[:success] = "Profile updated!"
        redirect_to @user
      else
        render 'edit';
      end
    end

    def index
      # @users = User.paginate(page: params[:page],per_page: 10)
      @users = handle_view_more_ajax(User)
      respond_to do |format|
        format.html
        format.js
      end
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end

    def following
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.followed_users.paginate(page: params[:page], per_page: ITEMS_PER_VIEW)
      render 'show_follow'
    end

    def followers
      @title = "Followers"
      @user = User.find(params[:id])
      @users = @user.followers.paginate(page: params[:page], per_page: ITEMS_PER_VIEW)
      render 'show_follow'
    end

    private      

      def admin_user
        redirect_to(root_path) unless current_user.admin?
      end

      def new_user
        if signed_in?
          redirect_to(root_path)
        end
      end
end
