class MessagesController < ApplicationController

  before_action :setting_group

def index
end


private
  def setting_group
    @group = Group.find(params[:group_id])
  end

end
