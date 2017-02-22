require 'rails_helper'

describe User do

  describe 'user_unit' do

    it "is valid a user_name" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a user-name" do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is valid a user-email" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a user-email" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is valid a user-password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a user-password" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

  end
end
