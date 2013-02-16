class SessionsController < ApplicationController
	def new
  end
  
  def create
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to users_tasks_path, :notice => "Logged in!"
    else
      
      render :action=>:new,:notice=>"Invalid email or password"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
