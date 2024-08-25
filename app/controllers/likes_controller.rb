class LikesController < ApplicationController
  def create
    Rails.logger.debug("Like Params: #{params.inspect}")
    @post = Post.find(params[:post_id])
    current_user.likes.create(post_id: @post.id)
    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end

  def destroy
    @post = Post.find(params[:id])
    current_user.likes.find_by(post_id: @post.id).destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream
    end
  end
end
