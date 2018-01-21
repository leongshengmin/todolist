class UserController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "new user created"
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def show
		
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
