class FeelingsController < ApplicationController
  include UsersHelper

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = current_user.feelings.build(feeling_params) unless session[:author_id].nil?

    if @feeling.save
      flash[:notice] = 'Created Successfully'
      redirect_to access_dashboard_path
    else
      flash[:notice] = 'An Error Occurred, Please try again'
      redirect_to access_dashboard_path
    end
  end

  def show; end

  private

  def feeling_params
    params.require(:feeling).permit(:text)
  end
end
