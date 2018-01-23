class TasklistController < ApplicationController
	def new 
		@tasklist = Tasklist.new
	end

	def create
		user = getUser
		tasklist = user.tasklists.create(tasklist_params)
		showTasklists(user)
	end

	def index
		user = getUser
		@tasklists = user.tasklists
		render 'show'
	end
	#displays all tasklists
	#tasks cat into indv tasklist group
	def show 
	end

	def destroy
		tasklist = Tasklist.find_by_id(params[:id])
		user = getUser
		user_tasklist = user.tasklists.find_by_id(params[:id])
		if !tasklist.nil?
			tasklist.destroy
			if !user_tasklist.nil?
				user_tasklist.destroy
			end
		end
		showTasklists(user)
	end

	def showTasklists(user)
  		redirect_to(user_tasklist_index_path(user))
  	end

	def getUser
		return User.find_by_id(params[:user_id])
	end

	def tasklist_params
		params.require(:tasklist).permit(:title, user_id: params[:user_id])
	end
end
