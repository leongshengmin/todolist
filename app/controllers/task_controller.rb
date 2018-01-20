class TaskController < ApplicationController

	include TaskHelper
	def new
		@task = Task.new
	end

	def create
		#new tasklist --> add task
		@tasklist = Tasklist.find_by_id(params[:id])
		@task = @tasklist.tasks.create(task_params)
		redirect_to root_path
	end

	def edit
		@tasklist_id = params[:tasklist_id]
		@tasklist = Tasklist.find(@tasklist_id)
		@task = @tasklist.tasks.find_by_id(params[:id])
	end

	def update
		if Task.update(params[:id], task_params)
			redirect_to root_path
		end
	end

	def destroy
		task_to_remove = Task.find_by(params[:id])
		task_to_remove.destroy
		redirect_to root_path
	end

	def task_params
		params.require(:task).permit(:title, :completed, 
									 tasklist_id: @tasklist_id)
	end

end