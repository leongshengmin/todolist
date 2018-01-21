class TaskController < ApplicationController

	include TaskHelper
	def new
		@task = Task.new
	end

	def create
		#new tasklist --> add task
		tasklist = Tasklist.find_by_id(params[:tasklist_id])
		tasklist.tasks.create(task_params)
		getUserHomepage
	end

	def edit
		tasklist_id = params[:tasklist_id]
		tasklist = Tasklist.find_by_id(tasklist_id)
		@task = tasklist.tasks.find_by_id(params[:task_id])
	end

	def update
		if Task.update(params[:task_id], task_params)
			getUserHomepage
		end
	end

	def destroy
		task_to_remove = Task.find_by_id(params[:task_id])
		user = User.find_by_id(params[:user_id])
		user_task = user.tasklists.find_by_id(params[:task_id])
		if !task_to_remove.nil?
			task_to_remove.destroy
			if !user_task.nil?
				user_task.destroy
			end
		end
		getUserHomepage
	end

	def getUserHomepage
		redirect_to '/user/' + params[:user_id] + '/show_tasklist'
	end

	def getTasklistID
		if @tasklist_id.nil?
			return params[:tasklist_id]
		else
			return @tasklist_id
		end
	end

	def task_params
		params.require(:task).permit(:title, :completed, 
									 tasklist_id: getTasklistID)
	end

end