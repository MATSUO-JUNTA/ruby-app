class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:edit, :update]
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

<<<<<<< HEAD
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: '更新が成功しました'
    else
      render :edit, alert: '更新に失敗しました'
    end
  end

=======
>>>>>>> 1ea2695 (投稿の詳細表示)
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
