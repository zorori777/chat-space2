require 'rails_helper'
require 'devise'

describe Groups::MessagesController do

  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message, user_id: user.id, group_id: group.id) }
  let(:messages){ create_list(:message,3, user: user, group: group) }

  before do
    sign_in user
  end

  describe 'GET #index' do

   before do
    login_user user
    get :index, group_id: group
  end

    it "populates an array of messages ordered by created_at DESC" do
    expect(assigns(:messages)).to match(messages)
    end

    it "assigns the requesteed message to @group" do
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
end

  describe 'POST #create' do

    it "saves the new message in the database" do
      expect{
      post :create,group_id:group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirects to messages #index" do
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end

    it "not save messaege in the database and render index_" do
      post :create, group_id: group, message: attributes_for(:message,body: "", group_id: group.id)
      expect(response).to render_template(:index)
    end

  end
end
