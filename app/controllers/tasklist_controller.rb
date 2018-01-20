class TasklistController < ApplicationController
	@@user = User.find(1)

	def new 
		@tasklist = Tasklist.new
	end

	def create
		#@user = User.find(params[:user_id])
		@tasklist = @@user.tasklists.create(tasklist_params)
		redirect_to show_tasklist_path
	end

	#displays all tasklists
	#tasks cat into indv tasklist group
	def show 
		@tasklists = Tasklist.all
	end

	def destroy
		tasklist = @@user.tasklists.find(params[:id])
		tasklist.destroy
		redirect_to show_tasklist_path
	end

	def tasklist_params
		params.require(:tasklist).permit(:title, user_id:@@user.id)
	end
end
