class AccessController < ApplicationController
  include AccessHelper
  include UsersHelper

  before_action :confirm_logged_in, except: %i[login create]

  def dashboard
    @all_users = User.all.includes([:photo_attachment])
    @all_feelings = Feeling.all.includes(%i[author comments]).limit(4).order(created_at: :desc)
    @feeling = Feeling.new
  end

  def login; end

  def create
    user = User.where(username: params[:username]).first if params[:username].present?
    if !user.nil?
      session[:author_id] = user.id
      flash[:notice] = 'You are in'
      redirect_to admin_path

    else
      flash[:notice] = 'Username not found, please try again'
      redirect_to access_path
    end
  end

  def show
    @user = User.find(params[:id])
    @all_user_feelings = Feeling.where(author_id: @user.id).includes([:author])
    @followers = followed_users(@user.followers.ids)
    @following = followed_users(@user.following.ids)
    @comment = Comment.new
    @feeling = Comment.new
    @user_feeling = Feeling.new
    redirect_to user_path(author.id) if @user_feeling.save
  end

  def logout
    session[:author_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to access_login_path
  end

  private

  def followed_users(user_ids_array)
    arr = []
    user_ids_array.each do |id|
      arr << User.find(id)
    end
    arr
  end
end
