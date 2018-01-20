module ApplicationHelper
	include TasklistHelper
	
	def full_title(title)
		title += ' | Task Manager'
	end
end
