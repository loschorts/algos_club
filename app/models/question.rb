class Question < ApplicationRecord
	belongs_to :user
	has_many :answers

	def ranked_answers
		answers.sort {|a,b| b.score <=> a.score }
	end

end
