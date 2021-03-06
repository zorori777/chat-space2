require 'rails_helper'
require 'devise'

describe Groups::MessagesController do

 let(:user){ create(:user) }
 let(:group){ create(:group) }
 let(:message){ create(:message, user_id: user.id, group_id: group.id) }
 let(:messages){ create_list(:message,3, user: user, group: group) }

  describe "logout user" do

    it "reditects to sign_up_path" do
      get :index, params: { group_id: group, user_id: user }
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'login user' do

  before do
     login_user user
  end

   context 'GET #index' do

    before do
     get :index, group_id: group
    end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
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

   context 'POST #create' do

      it "saves the new message in the database" do
        expect{
        post :create, group_id:group, message: attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "flashes a notice save_message" do
        post :create, group_id: group, message: attributes_for(:message)
        expect(flash[:notice]).to include ("作成成功しました")
      end

      it "redirects to messages #index" do
        post :create, group_id: group, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
      end

      it "flashes a alert unsave_message" do
        post :create, group_id: group, message: attributes_for(:message,body: "", group_id: group)
        expect(flash[:alert] ). to include ("作成を失敗しました")
      end

      it "not save messaege in the database and render index_" do
        post :create, group_id: group, message: attributes_for(:message,body: "", group_id: group)
        expect(response).to render_template(:index)
      end
   end

  end
end
