module TasklistHelper
	def removeCheckedTasks(task_ids)
		task_ids.each do |id| 
			task = Task.find(id)
			if task.checked == true
				task.destroy
			end
		end
	end
end
