class Groups::MessagesController < GroupsController

  before_action :setting_group, only: [:index]
  before_action :setting_message, only: [:index]

  def index
    # @groups = current_user.groups
    @group_id = params[:group_id]
    @messages = Message.find_by(@group_id)
  end

  def create
    @message = Message.new(create_message)
      if @message.save
         redirect_to group_messages_path, notice: "作成成功しました"
      else
         flash.now[:alert] = "作成を失敗しました"
         render :index
      end
  end

  private

  def setting_message
    @message = Message.new
  end

  def create_message
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end


  def setting_group
   @groups = current_user.groups
   @group = Group.find(params[:group_id])
  end

end
