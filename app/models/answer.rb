class Answer < ApplicationRecord
	include ExtraVotable

	belongs_to :user
	belongs_to :question
	
	acts_as_votable
	acts_as_commentable

end
