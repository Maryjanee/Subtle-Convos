class RelationshipsController < ApplicationController
  include UsersHelper

  def create
    @relationship = Relationship.create(follower_id: current_user.id, followed_id: params[:followed_id])
    if @relationship.save
      redirect_to user_pathcurrent_user.id
    else
      flash[:alert] = 'An Error Occurred, Please try again'
      redirect_to access_dashboard_path
    end
  end
end
