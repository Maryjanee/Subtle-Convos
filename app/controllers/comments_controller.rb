class CommentsController < ApplicationController
  include UsersHelper

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.feeling_id = params[:feeling_id]

    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
    else
      redirect_to request.referrer, notice: 'The comment has no content and could not be saved!'
    end
  end
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
