class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_users_answer, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  def upvote
    set_answer
    @answer.upvote_by current_user
    redirect_to :back
  end

  def downvote
    set_answer
    @answer.downvote_by current_user
    redirect_to :back
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  # GET /answers/1/edit
  def edit
    set_answer
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @question = Question.find(params[:question_id])
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_answer_path(@answer), notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(@answer.question), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
      @question = @answer.question
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :body)
    end
    
    def ensure_users_answer
      set_answer
      if @answer.user != current_user
        redirect_to :back, notice: "You can only #{params[:action]} your own materials." 
      end
    end
end
