class GroupsController < ApplicationController

  before_action :setting_group, only: [:edit,:update]
  def index
    @groups = current_user.groups
  end


  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(create_params)
      if @group.save
         redirect_to group_messages_path(@group),notice: '作成を成功しました'
      else
        flash.now[:alert] = "作成を失敗しました"
        render :new
      end
  end

  def edit
  end

  def update
    if @group.update(create_params)
      redirect_to group_messages_path(@group), notice: '編集を成功しました'
    else
      flash.now[:alert] = "編集を失敗しました"
        render :edit
    end
  end


  private

  def create_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def setting_group
    @group = Group.find(params[:id])
  end

end
