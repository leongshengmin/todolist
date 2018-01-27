class TasklistController < ApplicationController
	def new 
		@tasklist = Tasklist.new
	end

	#creates new tasklist bound to user
	#redirects to page showing all of user's tasklists
	def create
		user = getUser
		tasklist = user.tasklists.create(tasklist_params)
		showTasklists(user)
	end

	#receives user data, corr tasklists
	#renders the show page
	def index
		user = getUser
		@tasklists = user.tasklists
		render 'show'
	end
	
	#shows all tasklists
	def show 
	end

	#removes tasklist from database
	#and from user's tasklists
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
