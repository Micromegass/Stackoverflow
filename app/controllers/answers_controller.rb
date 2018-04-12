class AnswersController < ApplicationController

  def create
  	@answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Thank you for your help! Your answer has been saved"
      redirect_to question_path(@answer.question_id)
    else
      flash[:danger] = @answer.errors.full_messages.to_sentence
      redirect_to question_path(@answer.question_id)
    end

  end


  def voteup
    if signed_in?
      answer=Answer.find(params[:id])
      answer.points.create(user: current_user)
      redirect_to question_path(answer.question), notice: "Great! You just voted for this Answer"

    else 
      flash[:danger] =  "Please log in or register before you vote"
      redirect_to new_user_session_path
    end 

  end

  def votedown
    answer=Answer.find(params[:id])
    answer.points.where(user:current_user).take.try(:destroy)
    redirect_to question_path(answer.question), notice: "Ok! Apparently you don't like this answer anymore. Vote deleted!"
  end

  def answer_params
   params.require(:answer).permit(:description, :user_id, :question_id, :term, :body, :voteanswers, :answer_id)
 end
 
end
