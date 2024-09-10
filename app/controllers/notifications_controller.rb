class NotificationsController < ApplicationController
  before_action :require_login, only: [:index]
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @notifications.update_all(read: true)
  end
end