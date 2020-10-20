module UsersHelper
  def current_user
    User.find(session[:user_id])
  end
end
