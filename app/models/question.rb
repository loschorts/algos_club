class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	acts_as_taggable # alias for acts_as_taggable_on :tags

	def ranked_answers
		answers.sort {|a,b| b.score <=> a.score }
	end

end
