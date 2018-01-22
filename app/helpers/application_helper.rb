module ApplicationHelper
	include TasklistHelper
	include SessionsHelper
	
	def full_title(title)
		title += ' | Task Manager'
	end

end
