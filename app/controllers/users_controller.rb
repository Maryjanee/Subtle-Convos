class UsersController < ApplicationController
  
  before_action :confirm_logged_in
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to users_path
    else
      flash.now[:alert] = 'User creation unsuccessful.'
    end
  end


  
  def destroy
  end

  def update
  end
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
  
end
