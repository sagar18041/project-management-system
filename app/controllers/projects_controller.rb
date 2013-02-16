#require 'pry'
class ProjectsController < ApplicationController
	
	def index
		
		
		if params[:search]
  		@projects= Project.by_name(params[:search][:name]).by_start_date(params[:search][:start_date]).by_status(params[:search][:status])
		else
  		@projects = Project.all
  	end
		
	end

	def new
		@project = Project.new
		@users=User.all
	end

	def create

		@project = Project.new(params[:project]) 
		if @project.save
			redirect_to project_path(@project),:notice=>"Successfully created"
		else
			@users=User.all
			render :action=>:new
		end	

	end

	def edit
			@users=User.all
		@project = Project.find(params[:id])

	end

	def update

		@project = Project.find(params[:id])
		params[:project][:user_ids] = [] if params[:project][:user_ids].blank?
		if @project.update_attributes(params[:project])
			redirect_to project_path(@project),:notice=>"Successfully updated"
		else
			@users=User.all
			render :action=>:edit
		end	
	end

	def delete
		@project = Project.find(params[:id])
		
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path,:notice=>"Successfully destroyed"
	end

	def show
		@users=User.all
		@project = Project.find(params[:id])
	end

	def finish_project
		@project = Project.find(params[:id])
		@project.set_status
		if @project.update_attributes(params[:project])
			redirect_to projects_path(@project),:notice=>"Successfully updated"
		else
			@users=User.all
			render :action=>:edit
		end	
	end

end
