class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @posts = Post.order('id DESC').paginate(:page => params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: '新增成功!!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新成功!!'
    else
      render :new
    end
  end


  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('id DESC')
    @user = User.find(@post.user_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: '已刪除！！'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
