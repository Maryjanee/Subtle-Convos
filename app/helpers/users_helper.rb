module UsersHelper
  def current_user
    User.find(session[:author_id])
  end
end
