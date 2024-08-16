class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authorize_post, only: [:destroy]
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
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: '更新が成功しました'
    else
      render :edit, alert: '更新に失敗しました'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: '削除が成功しました'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def authorize_post
    unless @post.user == current_user
      redirect_to root_path, notice: '他のユーザーが作成した投稿のため削除できません'
    end
  end
end
