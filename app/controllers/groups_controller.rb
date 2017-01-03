class GroupsController < ApplicationController

  before_action :setting_group,except: [:new,:create]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
      if @group.save
         redirect_to root_path(@group),notice: '作成を成功しました'
      else
        flash.now[:alert] = "作成を失敗しました"
        render :new
      end
  end

  def edit
  end


private
  def setting_group
    @group = Group.find(params[:id])
  end


  def create_params
    params.require(:group).permit(:name)
  end

end
