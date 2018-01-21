module SessionsHelper
	def login(user)
		session[:user_id] = user.id
		@current_user = user
	end

	def is_logged_in?(user)
		@current_user == user
	end

	def is_in_session?
		!@current_user.nil?
	end
end
