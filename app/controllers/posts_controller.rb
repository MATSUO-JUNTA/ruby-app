class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "投稿が成功しました。"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path, notice: '更新が成功しました'
    else
      render :edit, alert: '更新に失敗しました'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
