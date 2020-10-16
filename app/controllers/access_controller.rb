class AccessController < ApplicationController
  before_action :confirm_logged_in, except: %i[login create]
  def dashboard
    @all_users = User.all
    @all_feelings = Feeling.all.order(created_at: :desc)

    @feeling = Feeling.new
  end

  def login
    # display login form
  end

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

  def show; end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to access_login_path
  end
end
