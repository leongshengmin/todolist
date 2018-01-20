class StaticPagesController < ApplicationController

	include ApplicationHelper
	
	def home
		@tasks = Task.all
	end
end
