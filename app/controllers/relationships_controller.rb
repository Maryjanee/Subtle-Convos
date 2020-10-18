class RelationshipsController < ApplicationController

  def create
    @relationship = Relationship.create(follower_id: current_user.id, followed_id: params[:followed_id])
    if  @relationship.save
    redirect_to access_dashboard_path 
    else
      flash[:alert] = 'An Error Occurred, Please try again'
      redirect_to access_dashboard_path
    end 
  end
  
  private
  
  def current_user
    User.find(session[:user_id])
  end
  
 
end
