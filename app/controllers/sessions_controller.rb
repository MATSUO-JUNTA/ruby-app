class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, notice: 'ログインに成功しました。'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトに成功しました。'
  end
end
