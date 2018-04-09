class CommentsController < ApplicationController

  def create
  		@comment = Comment.new(comment_params)
  		if @comment.save
  			flash[:success] = "Thanks for your help! Comment added successfully"
  		else
  			flash[:danger] = "We are very sorry, but an error occured. Comment couldn't be added"
  		end

  		if comment_params[:commentable_type] == 'Question'
  			 redirect_to question_path(comment_params[:commentable_id])
  		else
  			@answer = Answer.find(comment_params[:commentable_id])
  			redirect_to question_path(@answer.question_id)
  		end
  	 end

  	private
  		def comment_params
  			params.require(:comment).permit(:commentable_type, :commentable_id, :body, :user_id)
  		end
end

#
# end

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
