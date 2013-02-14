class TasksController < ApplicationController
	before_filter :load_milestone
	def new
		@task=@milestone.tasks.new

		@users=User.all
	end

	def create
	
		@task=@milestone.tasks.new(params[:task])
		if @task.save
	
			redirect_to milestone_task_path(@milestone,@task),:notice=>"Successfully created"
		else
			render :action =>:new
		end
	end

	def show
		@task= @milestone.tasks.find(params[:id])
	end

	def index

		@tasks=@milestone.tasks
		
	end

	def destroy
		@task=@milestone.tasks.find(params[:id])
		@task.destroy
		redirect_to milestone_tasks_path,:notice=>"Successfully destroyed"
	end

	def edit
		@task= @milestone.tasks.find(params[:id])
		@users=User.all
	end

	def update

		@task=@milestone.tasks.find(params[:id])
		if @task.update_attributes(params[:task])
			redirect_to milestone_task_path(@milestone,@task),:notice=>"Successfully updated"
		else
			render :action =>:edit
		end
	end

	def finish_task
		@task=@milestone.tasks.find(params[:id])
		@task.set_status
		if @task.update_attributes(params[:task])
			redirect_to milestone_tasks_path(@milestone,@task),:notice=>"Successfully updated"
		else
			render :action =>:edit
		end
	end

	protected
	def load_milestone
		#@project=Project.find(params[:project_id])
		#@milestone = @project.milestones.find(params[:milestone_id])
		@milestone=Milestone.find(params[:milestone_id])
	end
end
