module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end  

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
	  !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def store_location
    session[:return_to] = request.url
  end

  def store_previous_location
    session[:previous_page] = request.referer
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || session[:previous_page] || default)
    session.delete(:return_to)
    session.delete(:previous_page)
  end
end
