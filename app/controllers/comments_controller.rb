class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
    else
      redirect_to request.referrer, alert: 'There was a problem creating the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :feeling , :body)
  end
  
  def current_user
    User.find(session[:user_id])
  end
  
end
