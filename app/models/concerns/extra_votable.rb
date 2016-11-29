require 'active_support/concern'

module ExtraVotable
  extend ActiveSupport::Concern

  included do
		def score
			count_votes_up - count_votes_down
		end
  end

  module ClassMethods

  end

end