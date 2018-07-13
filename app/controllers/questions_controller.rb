class QuestionsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @questions = if params[:term]
    Question.where("title iLIKE ? OR description iLIKE ?" , "%#{params[:term]}%", "%#{params[:term]}%")
    else
    @questions = Question.all
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
    flash[:success] = "Your Question was published my friend! You will have solved your problem soon"
    redirect_to questions_path 
    else
    render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @comment = Comment.new
    @point = Point.new
  end



  def edit
    @question = Question.find(params[:id])
  end


  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Awesome, changes have been applied successfully"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path, notice: "Gone! The post was deleted"
  end


  def voteup
			question=Question.find(params[:id])
      question.points.create(user: current_user)
      flash[:success] = "Great! You just voted for this Question"
      redirect_to question_path
    
  end

    def votedown
			question=Question.find(params[:id])
			question.points.where(user:current_user).take.try(:destroy)
      flash[:danger] = "Ok! Apparently you don't like this question anymore. Vote deleted!"
      redirect_to question_path
    end

  private
  def question_params
  params.require(:question).permit(:title, :description, :user_id, :term, :votes, :body, :points)
  end

end
