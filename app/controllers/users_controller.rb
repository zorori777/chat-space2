class UsersController < ApplicationController

  before_action :user_setting
  def edit
  end

  def update
    if @user.update_with_password(update_params)
       redirect_to root_path, notice: '編集成功しました'
    else
      flash.now[:alert] = "編集を失敗しました"
      render :edit
    end
  end


  private

  def update_params
    params.require(:user).permit(:name, :email,:password, :current_password, :password_comfirmation)
  end

  def user_setting
    @user = User.find(params[:id])
  end

end
