class GroupsController < ApplicationController

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

  def create_params
    params.require(:group).permit(:name)
  end

end
