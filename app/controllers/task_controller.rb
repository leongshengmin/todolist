class TaskController < ApplicationController

	include TaskHelper
	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if !@task.nil?
			@task.save
			redirect_to root_path
		end
	end

	def edit
		@task = Task.find_by(params[:id])
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
		params.require(:task).permit(:title, :completed)
	end

end