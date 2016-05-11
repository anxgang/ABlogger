module CommentsHelper
  def comment_user(comment)
     @user = User.find(comment.user_id)
     @user.email
  end
end
