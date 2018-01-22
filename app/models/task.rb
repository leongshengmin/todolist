class Task < ApplicationRecord
	include PgSearch
	pg_search_scope :search_by_task, 
					 against: [:title, :date, :completed],
					 using: {
					 	tsearch: {
					 		prefix: true,
					 		highlight: {
					 			start_sel: '<b>',
					 			stop_sel: '<b>'
					 		}
					 	}
					 }
	
	belongs_to :tasklist
end
