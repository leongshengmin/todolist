class TasklistController < ApplicationController
	def new 
		@tasklist = Tasklist.new
	end

	def create
		@user = getUser
		@tasklist = @user.tasklists.create(tasklist_params)
		redirect_to '/user/' + params[:user_id] + '/show_tasklist'
	end

	#displays all tasklists
	#tasks cat into indv tasklist group
	def show 
		@user = getUser
		@tasklists = @user.tasklists
	end

	def destroy
		tasklist = Tasklist.find_by_id(params[:tasklist_id])
		puts "tasklist searched:"
		puts tasklist
		if !tasklist.nil?
			@user = getUser
			@user_tasklist = @user.tasklists.find_by_id(params[:tasklist_id])
			tasklist.destroy
			if !@user_tasklist.nil?
				puts "user's tasklist is not empty"
				puts "deleting tasklist in user acct"
				puts @user_tasklist
				@user_tasklist.destroy
				puts "destroyed"
			end
			puts "destroyed tasklist"
		end
		puts "no tasklist found"
		redirect_to '/user/' + params[:user_id] + '/show_tasklist'
	end

	def getUser
		return User.find_by_id(params[:user_id])
	end

	def tasklist_params
		params.require(:tasklist).permit(:title, user_id:@user.id)
	end
end
