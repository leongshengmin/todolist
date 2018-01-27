class TaskController < ApplicationController
	include TaskHelper
	def new
		@task = Task.new
	end

	#opens up a modal for new task
	#in the same page
	def modal_for_new_task
		respond_to do |format|
			format.js
		end
	end

	#upon completion
	#remove tasks from view
	def completed
		task = Task.find_by_id(params[:id])
		if !task.completed
			task.destroy
		end	
		showTasklists
	end

	#creates a new task bound to corr tasklist
	def create
		tasklist = findTasklist
		task = tasklist.tasks.create(task_params)
		showTasklists
	end

	#redirects to new page to edit task
	def edit
		@task = Task.find_by_id(params[:id])
	end

	#refreshes page upon update 
	#to reflect changes
	def update
		if Task.update(params[:id], task_params)
			showTasklists
		end
	end

	#destroys task by removing from database,
	#user's tasklist
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

	#opens up a modal for viewing search results
	def modal_for_search
		#query is non-empty
		if params[:searchterm]
			@tasks_found = Task.search(params[:searchterm])
			@tasklists_found = Tasklist.search(params[:searchterm])
		#no query given so we display all tasks
		else 
			@tasks_found = Task.all
		end
		respond_to do |format|
			format.js
		end
	end

	#finds and returns the corr tasklist
	def findTasklist
		tasklist_id = params[:tasklist_id]
		tasklist = Tasklist.find_by_id(tasklist_id)
		return tasklist
	end

	#redirects to page to display all tasklists
	def showTasklists
		user = User.find_by_id(params[:user_id])
  		redirect_to(user_tasklist_index_path(user))
  	end

	def task_params
		params.require(:task).permit(:title, :date, :completed, 
									 tasklist_id: params[:tasklist_id])
	end

end