class AnswersController < ApplicationController

  def create
  	@answer = Answer.new(answer_params)
    if @answer.save
  		flash[:success] = "Thank you for your help! Your answer has been saved"
  		redirect_to root_path
    else
      flash[:danger] = "Sorry, there was an error. Answer has not been saved"
      redirect_to root_path

    end

end

          def answer_params
           params.require(:answer).permit(:description, :user_id, :question_id)
          end

  # def create
  #   @question = Question.find(params[:question_id])
  #   if @question.answers.create(answers_params)
  #   flash[:success] = "Successfully created your answer"
  #
  #
  #   redirect_to @question
  #   else
  #   flash[:alert] = "A problem occured, your answer could not be saved, we are sorry"
  #   end
  # end
  #
  # private
  #   def answers_params
  #     params.require(:answer).permit(:description).merge(user: current_user)
  #   end

end
