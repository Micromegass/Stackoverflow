class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @question.votes.create(user: current_user)

    redirect_to @question
  end

  def destroy
    @question = Question.find(params[:question_id])
    @question.votes.where(user: current_user).take.try(:destroy)
    redirect_to @question

  end

end
