class RelationshipsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to user_path(user)
  end

  def destroy
    user = Relationship.find(params[:user_id]).followed
    current_user.unfollow(user)
    redirect_to user_path(user)
  end
end
