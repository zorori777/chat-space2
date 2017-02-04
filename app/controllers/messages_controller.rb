class MessagesController < ApplicationController

  before_action :setting_group,only: [:index]

def index
end

private
  def setting_group
    @group = Group.find(params[:group_id])
  end

end
