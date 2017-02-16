class Groups::MessagesController < GroupsController

  before_action :setting_group, only: [:index]
  before_action :setting_message, only: [:index]


  def index
    # @groups = current_user.groups
    # @group = Group(params[:group_id])
    @message = Message.new
  end

  def new
  end

  def create
    @message = current_user.messages.new(create_message)
      if @message.save
         redirect_to group_messages_path, notice: "作成成功しました"
      else
        @groups = current_user.groups
        @group = Group.find(params[:group_id])
        @messages = @group.messages
         flash.now[:alert] = "作成を失敗しました"
         render action: :index
      end
  end

  private

  def create_message
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def setting_message
    @messages = @group.messages.includes(:user)
  end

  def setting_group
   @groups = current_user.groups
   @group = Group.find(params[:group_id])
  end

end
