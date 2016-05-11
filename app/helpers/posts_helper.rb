module PostsHelper
  def is_current_user?(user_id)
    if current_user
      user_id==current_user.id
    end
  end
end
