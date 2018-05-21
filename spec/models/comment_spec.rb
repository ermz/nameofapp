require 'rails_helper'

describe Comment do
  context "when a comment is created with all attributes" do
    it 'valid comment, with all attributes' do
      expect(FactoryBot.create(:comment)).to be_valid
    end
  end

  context "when a comment is created without all necessary attributes" do
    it 'invalid comment, missing attributes' do
      expect(FactoryBot.build(:comment, body: "")).not_to be_valid
    end
  end
end
