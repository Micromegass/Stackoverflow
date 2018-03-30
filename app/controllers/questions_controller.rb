class QuestionsController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
    redirect_to questions_path, notice: "Your Question was published my friend! You will have solved your problem soon"
    else
    render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end



  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: "Awesome, changes have been applied successfully"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path, notice: "Gone! The post was deleted"
  end


  private
  def question_params
  params.require(:question).permit(:title, :description)
  end

end
