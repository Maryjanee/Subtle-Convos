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
      @user.photo.attach(params[:user][:photo])
      @user.cover_image.attach(params[:user][:cover_image])
      flash[:notice] = 'Your account has been created '
      session[:author_id] = @user.id
      redirect_to access_dashboard_path

    else
      flash[:alert] = 'An Error has occured ,please try again'
    end
  end

 

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end
end
