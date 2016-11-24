require 'active_support/concern'

module ExtraVotable
  extend ActiveSupport::Concern

  included do
		def score
			count_votes_up - count_votes_down
		end
  end

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods

  end

end