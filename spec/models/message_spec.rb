require 'rails_helper'

    describe Message do
      describe 'message-send' do

        it "is valid a message-body" do
        message = build(:message)
        expect(message).to be_valid
    end

        it "is invalid without a message-body" do
        message = build(:message, body: "")
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
    end

      describe 'message-group-Assosiation' do
        it "belongs_to group " do
        assc = described_class.reflect_on_association(:group)
        expect(assc.macro).to eq :belongs_to
        # expect
     end
   end

     describe 'message-user-Assosiation' do
      it "belongs_to user " do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
    end
  end

 end
end

