class CommentsController < ApplicationController



def create
  @comment = Comment.create(comments_params)
  if @comment.save
    flash[:success] = "Thank you for leaving a comment"
    redirect_to root_path
  else
    flash[:alert] = "An error occured. We couldn't save your comment. Please try again"
    redirect_to root_path
  end


private
  def comments_params
    params.require(:comment).permit(:body, :user_id).merge(user: current_user)
  end



end

  # def create
  #   @question = Question.find(params[:question_id])
  #   @question.comments.create(comments_params)
  #
  #   redirect_to @question
  # end
  #
  # private
  #   def comments_params
  #     params.require(:comment).permit(:body).merge(user: current_user)
  #   end
end
