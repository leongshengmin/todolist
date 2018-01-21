class SessionsController < ApplicationController
	include SessionsHelper

	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			flash[:success] = "Logged in successfully"
			login(@user)
			redirect_to '/user/' + @user.id.to_s + '/show_tasklist'
		else
			flash.now[:danger] = "Invalid email or password"
  			render 'new'
  		end
  	end

end
