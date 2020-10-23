module AccessHelper
  def who_not_to_follow
    current_user.following.ids << current_user.id
  end

  def first_user_name(user)
    User.find(user.following.ids[0]).full_name
  end

  def first_user_id(user)
    User.find(user.following.ids[0]).id
  end

  def author_name(comment)
    User.find(comment.author_id).username
  end
end
