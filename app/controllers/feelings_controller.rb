class FeelingsController < ApplicationController
  include UsersHelper

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = User.find(session[:user_id]).feelings.build(feeling_params) unless session[:user_id].nil?

    if @feeling.save
      flash[:notice] = 'Created Successfully'
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = 'An Error Occurred, Please try again'
      redirect_to new_feeling_path
    end
  end

  def show; end

  private

  def feeling_params
    params.require(:feeling).permit(:body)
  end
end
