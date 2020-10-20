class CommentsController < ApplicationController
  
  include UsersHelper
  
  def create
    @comment = current_user.comments.new
    @comment.body = params[:comment][:body]
    @comment.feeling_id = params[:feeling_id]
    
    if @comment.save
      redirect_to request.referrer, notice: 'Comment was successfully created.'
    else
      redirect_to request.referrer, alert: 'There was a problem creating the comment'
    end
  end

  
  
end
