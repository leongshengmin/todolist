class UserController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if !@user.nil?
			flash[:success] = "new user created"
		end
	end

	def show
		@tasklists = Tasklist.all
	end
	
	def user_params
		params.require(:task).permit(:name, :email)
	end

end
