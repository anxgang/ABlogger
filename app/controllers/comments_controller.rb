class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_param)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      redirect_to @post, alert: '儲存備註失敗'
    end

  end

  private
  def comment_param
    params.require(:comment).permit(:body)
  end
end
