class TasklistController < ApplicationController
	def new 
		@tasklist = Tasklist.new
	end
end
