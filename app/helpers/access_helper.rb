module AccessHelper
  def who_not_to_follow
    current_user.following.ids << current_user.id
  end

  # def followed_by(user)
  #   user.following.first.first_name
  # end
end
