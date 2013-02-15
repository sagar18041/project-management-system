class MilestonesController < ApplicationController
	before_filter :load_project
	def new
		@milestone=@project.milestones.new
	end

	def create
		@milestone=@project.milestones.new(params[:milestone])
		if @milestone.save
			redirect_to project_milestone_path(@project,@milestone),:notice=>"Successfully created"
		else
			render :action =>:new
		end
	end

	def show
		@milestone= @project.milestones.find(params[:id])
	end

	def index
		if params[:search]
 			@milestones= @project.milestones.by_name(params[:search][:name]).by_start_date(params[:search][:start_date]).by_status(params[:search][:status])
  	else
  		@milestones=@project.milestones
  		
  	end
  	#binding.pry
	end

	def destroy
		@milestone=@project.milestones.find(params[:id])
		@milestone.destroy
		redirect_to project_milestones_path,:notice=>"Successfully destroyed"
	end

	def edit
		@milestone= @project.milestones.find(params[:id])
	end

	def update
		@milestone=@project.milestones.find(params[:id])
		if @milestone.update_attributes(params[:milestone])
			redirect_to project_milestone_path(@project,@milestone),:notice=>"Successfully updated"
		else
			render :action =>:edit
		end
	end


	def finish_milestone
		@milestone=@project.milestones.find(params[:id])
		@milestone.set_status
		if @milestone.update_attributes(params[:milestone])
			redirect_to project_milestones_path(@project,@milestone),:notice=>"Successfully updated"
		else
			render :action =>:edit
		end	
	end

	protected
	def load_project
		@project=Project.find(params[:project_id])
	end

end
