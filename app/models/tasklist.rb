class Tasklist < ApplicationRecord
	belongs_to :user
	has_many :tasks

	def self.search(query)
		where('title LIKE ?', "%#{query}%")
	end
end
