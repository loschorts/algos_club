class VotesController < ApplicationController
	def upvote
    set_votable
    @votable.upvote_by current_user
    redirect_to :back
  end

  def downvote
    set_votable
    @votable.downvote_by current_user
    redirect_to :back
  end

  private

  def set_votable
  	@votable = params[:model].constantize.find(params[:id])
  end

end
