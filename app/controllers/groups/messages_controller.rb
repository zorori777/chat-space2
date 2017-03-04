class Groups::MessagesController < GroupsController

  before_action :setting_group, :setting_message, only: [:index, :create]

  def index
    @message = Message.new
  end

  def new
  end

  def create
    @message = current_user.messages.new(create_message)
      if @message.save
        respond_to do |format|
          format.html { redirect_to group_messages_path(@group) }
          format.json { render json: @message }
        end
      else
         render :index, alert: "作成を失敗しました"
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
