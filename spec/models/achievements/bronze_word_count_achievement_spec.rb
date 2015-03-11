require 'rails_helper'

xdescribe BronzeWordCountAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if < 1000" do
      create(:post)
      expect(BronzeWordCountAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 1000" do
      content = "Lorem " * 1001
      create(:post, content: content, user: user)
      expect(BronzeWordCountAchievement.earned_by?(user)).to eq(true)
    end
  end
end
