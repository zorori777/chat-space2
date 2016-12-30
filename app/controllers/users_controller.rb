class UsersController < ApplicationController

  before_action :user_setting
  def edit
  end

  def update
      if current_user.update_with_password(update_params)
         redirect_to root_path,notice: '編集成功しました'
      else
        redirect_to edit_user_path,alert: '編集失敗しました'
      end
  end


  private
    def update_params
      params.require(:user).permit(:name,:email,:password,:current_password,:password_comfirmation)
    end

    def user_setting
      @user =User.find(params[:id])
    end
end
