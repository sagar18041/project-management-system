class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  def require_user
  	
  end

  private
  
  def current_user
  	#binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
