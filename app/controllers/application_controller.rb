class ApplicationController < ActionController::Base
  
  private
    def confirm_logged_in
      unless session[:user_id]
        flash[:alert] = 'You need to Login or sign up to continue'
        redirect_to access_login_path
      end
    end
end
