class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_users_question, only: [:edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    if params[:search_value]
      @questions = Question.where("#{params[:search_option]} ILIKE ?", "%#{params[:search_value]}%")
    else
      @questions = Question.all
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  # GET /questions/1/edit
  def edit
    @tags = ActsAsTaggableOn::Tag.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params[:question][:tag_list] = params[:question][:tag_list] || []
      params[:question][:tag_list] += params[:new_tag_list].split(',')
      params[:question][:tag_list] = params[:question][:tag_list].map { |tag| tag.downcase }
      params.require(:question).permit(:user_id, :body, :title, :tag_list => [])
    end

    def ensure_users_question
      set_question
      if @question.user != current_user
        redirect_to :back, notice: 'You can only edit your own materials.'
      end
    end
end
