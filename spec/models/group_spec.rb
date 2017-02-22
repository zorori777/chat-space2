require 'rails_helper'

describe Group do
  describe "group-validation" do

    it "is valid a group-name" do
      group = build(:group)
      expect(group).to be_valid
    end

    it "is invalid a group-name" do
      group = build(:group, name:"")
      group.valid?
      expect(group.errors[:name]).to include("を入力してください")
    end

  end
end
