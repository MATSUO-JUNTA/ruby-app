class CommentsController < ApplicationController
  before_action :require_login, only: [:create]
  def create
    Rails.logger.debug("Comment Params: #{comment_params.inspect}")
    @post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)
    comment.post = @post
    if comment.save
      redirect_to @post, notice: "コメントが作成されました"
    else
      redirect_to @post, notice: "コメント作成に失敗しました"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
