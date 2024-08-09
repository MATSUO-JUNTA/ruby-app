class ApplicationController < ActionController::Base
  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: 'ログインが必要です'
    end
  end
end
