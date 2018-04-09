class QuestionsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @questions = if params[:term]
    Question.where("title LIKE ? OR description LIKE ?" , "%#{params[:term]}%", "%#{params[:term]}%")
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
    redirect_to questions_path, notice: "Your Question was published my friend! You will have solved your problem soon"
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


  def voteup
			question=Question.find(params[:id])
			question.points.create(user: current_user)
			redirect_to question_path, notice: "Great! You just voted for this Question"
  end

    def votedown
			question=Question.find(params[:id])
			question.points.where(user:current_user).take.try(:destroy)
			redirect_to question_path, notice: "Ok! Apparently you don't like this question anymore. Vote deleted!"
    end

  private
  def question_params
  params.require(:question).permit(:title, :description, :user_id, :term, :votes, :body, :points)
  end

end
