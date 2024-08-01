class SessionsController < ApplicationController
  def new
  end

  def create
<<<<<<< HEAD
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, notice: 'ログインに成功しました。'
    else
=======
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います'
>>>>>>> efde6c0 (ログイン機能の実装)
      render :new
    end
  end
end
