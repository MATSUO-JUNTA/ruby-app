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
<<<<<<< HEAD
=======
>>>>>>> c970b9a (投稿の編集機能)
  def edit
  end

  def update
    if @post.update(post_params)
<<<<<<< HEAD
      redirect_to root_path, notice: '更新が成功しました'
    else
      render :edit, alert: '更新に失敗しました'
    end
  end

=======
>>>>>>> 1ea2695 (投稿の詳細表示)
=======
      redirect_to posts_path, notice: '投稿が更新されました'
    else
      render :edit
    end
  end

>>>>>>> c970b9a (投稿の編集機能)
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
<<<<<<< HEAD
    @post = current_user.posts.find(params[:id])
=======
    @post = Post.find(params[:id])
  end

  def authorize_user
    redirect_to posts_path, alert: '権限がありません' unless @post.user == current_user
>>>>>>> c970b9a (投稿の編集機能)
  end
end
