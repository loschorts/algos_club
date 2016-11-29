class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end


  def show
    @questions = Question.tagged_with(@tag.name)
  end

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end
end
