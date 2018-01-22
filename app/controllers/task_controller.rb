class TaskController < ApplicationController

	include TaskHelper
	def new
		@task = Task.new
	end

	def modal_for_new_task
		respond_to do |format|
			format.js
		end
	end

	def completed
		task = Task.find_by_id(params[:id])
		task.completed = true
		showTasklists
	end

	def create
		tasklist = findTasklist
		task = tasklist.tasks.create(task_params)
		showTasklists
	end

	def edit
		@task = Task.find_by_id(params[:id])
	end

	def update
		if Task.update(params[:id], task_params)
			showTasklists
		end
	end

	def destroy
		task_to_remove = Task.find_by_id(params[:id])
		user = User.find_by_id(params[:user_id])
		user_task = user.tasklists.find_by_id(params[:id])
		if !task_to_remove.nil?
			task_to_remove.destroy
			if !user_task.nil?
				user_task.destroy
			end
		end
		showTasklists
	end

	def findTask
		if params[:searchterm]
			@tasks_found = Task.search_by_task(params[:searchterm]).with_pg_search_highlight
		else 
			@tasks_found = Task.all
		end
	end

	def findTasklist
		tasklist_id = params[:tasklist_id]
		tasklist = Tasklist.find_by_id(tasklist_id)
		return tasklist
	end

	def showTasklists
		user = User.find_by_id(params[:user_id])
  		redirect_to(user_tasklist_index_path(user))
  	end

	def task_params
		params.require(:task).permit(:title, :date, :completed, 
									 tasklist_id: params[:tasklist_id])
	end

end