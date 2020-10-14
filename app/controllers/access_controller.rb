class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :create]
  def dashboard 
    @all_users = User.all;
    @all_feelings = Feeling.all.order(created_at: :desc);   
    
    @feeling = Feeling.new
  end

  def login
    #display login form
  end
  

  def create
    if params[:username].present?
      user = User.where(:name => params[:username]).first
    end
    if !user.nil?
      session[:user_id] = user.id
      flash[:notice] = 'You are in'
      redirect_to admin_path
      
    else
      flash[:alert] = 'Username not found, please try again'
      redirect_to access_path
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to access_login_path
  end
  
end
