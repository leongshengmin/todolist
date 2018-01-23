class Task < ApplicationRecord
	belongs_to :tasklist

	def self.search(query)
		where('title LIKE ?', "%#{query}%")
	end
end
