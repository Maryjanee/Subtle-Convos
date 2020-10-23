class CommentsController < ApplicationController
  include UsersHelper

  def create
    @comment = Feeling.find(params[:feeling_id]).comments.build(comment_params)
    @comment.author_id = params[:author_id]
    @comment.feeling_id = params[:feeling_id]

    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
    else
      redirect_to request.referrer, notice: 'The comment has no content and could not be saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
