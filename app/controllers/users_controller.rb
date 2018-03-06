class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    # binding.pry
    logger.debug("create() start")

    # パラメータ取得
    @user = User.new(user_params)

    # ユーザデータの保存
    if @user.save
      # 失敗した時はroot_pathへリダイレクト
      redirect_to root_path, notice: '登録が完了しました'
    else
      flash.now[:alert] = "登録に失敗しました"

      # 成功時はnewのテンプレを描画する
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
