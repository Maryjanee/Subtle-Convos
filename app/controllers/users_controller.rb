class UsersController < ApplicationController
  before_action :confirm_logged_in, except: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.avatar.attach(params[:user][:avatar])
      redirect_to access_login_path
      flash.now[:alert] = 'Your account has been created '

    else
      flash.now[:alert] = 'An Error has occured ,please try again'
    end
  end

  def show; end

  def destroy; end

  def update; end

  private

  def user_params
    params.require(:user).permit(:name, :full_name, :avatar)
  end
end
