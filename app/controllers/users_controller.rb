class UsersController < ApplicationController
	def new
		@user=User.new
		@projects=Project.all
	end

	def create
		@user=User.new(params[:user])
		if @user.save
			redirect_to projects_path(@user),:notice=>"Successfully logged in"
		else
			@projects=Project.all
			render :action =>:new
		end
	end

	def sign_up
		@user=User.new
	end

	def show
		@projects=Project.all
		@user= User.find(params[:id])
	end

	def index

		if params[:search]
 			@users= User.by_name(params[:search][:name]).by_address(params[:search][:address])
  	else
  		@users=User.all
  	end		
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to users_path,:notice=>"Successfully destroyed"
	end

	def edit
		@projects=Project.all
		@user= User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update_attributes(params[:user])

			redirect_to user_path(@user),:notice=>"Successfully updated"
		else
			@projects=Project.all
			render :action =>:new
		end
	end
	def users_tasks
		#binding.pry
		@tasks=current_user.tasks
		#if params[:search][:name]
 		#	@tasks=@tasks.find_by_name(params[:search][:name])
 		#elsif params[:search][:status]
 		#	@tasks=@tasks.find_by_status(params[:search][:status])
   	#end		
		
	end

end