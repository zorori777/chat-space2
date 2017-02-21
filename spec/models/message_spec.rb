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
  end
end

