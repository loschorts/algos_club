class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_votable

	def upvote
    set_votable
    @votable.upvote_by current_user
    redirect_to :back, { notice: "Upvoted #{params[:model]}" }
  end

  def downvote
    set_votable
    @votable.downvote_by current_user
    redirect_to :back, { notice: "Downvoted #{params[:model]}" }
  end

  private

  def set_votable
    redirect_back(root_path) unless params[:model] && params[:id]
  	@votable = params[:model].constantize.find(params[:id])
    redirect_back(root_path, { notice: "Not Votable" }) unless @votable
  end

end
