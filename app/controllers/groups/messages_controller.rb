class Groups::MessagesController < GroupsController

  before_action :setting_group, only: [:index]

  def index
  end

  private
    def setting_group
     @groups = current_user.groups
     @group = Group.find(params[:group_id])
    end

  end
