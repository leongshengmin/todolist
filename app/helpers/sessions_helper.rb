module SessionsHelper

	@@current_user = nil

	def login(user)
		session[:user_id] = user.id
		@@current_user = user
	end

	def logout
		session[:user_id] = nil
		@@current_user = nil;
	end

	def is_logged_in?(user)
		@@current_user == user
	end

	def is_in_session?
		!@@current_user.nil?
	end
end
