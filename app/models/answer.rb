class Answer < ApplicationRecord
	belongs_to :user
	belongs_to :question
	
	acts_as_votable
	acts_as_commentable

	def score
		count_votes_up - count_votes_down
	end

end
