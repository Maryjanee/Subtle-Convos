class AccessController < ApplicationController
  include AccessHelper

  before_action :confirm_logged_in, except: %i[login create]
  def dashboard
    @all_users = User.all.limit(5).includes([:avatar_attachment])
    @all_feelings = Feeling.all.limit(4).order(created_at: :desc).includes([:user])
    @feeling = Feeling.new
  end

  def login; end

  def create
    user = User.where(name: params[:username]).first if params[:username].present?
    if !user.nil?
      session[:user_id] = user.id
      flash[:notice] = 'You are in'
      redirect_to admin_path

    else
      flash[:alert] = 'Username not found, please try again'
      redirect_to access_path
    end
  end

  def show
    @user = User.find(params[:id])
    @all_user_feelings = Feeling.where(user_id: @user.id)
    @followed_users = followed_users(@user.following.ids)
    @feeling = Feeling.new
  end

  def logout
    session[:user_id] = nil
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
