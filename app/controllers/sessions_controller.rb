class SessionsController < ApplicationController
	include SessionsHelper

	def new
	end

	def create
		@user = User.find_by_email(params[:sessions][:email].downcase)
		if @user && @user.authenticate(params[:sessions][:password])
			flash[:success] = "Logged in successfully"
			login(@user)
			showTasklists(@user)
		else
			flash.now[:danger] = "Invalid email or password"
  			render 'new'
  		end
  	end

  	def logout
  		logout
      redirect_to root_path
  	end

  	def showTasklists(user)
  		redirect_to(user_tasklist_index_path(user))
  	end

end
