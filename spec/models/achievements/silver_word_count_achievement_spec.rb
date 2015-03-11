require 'rails_helper'

xdescribe SilverWordCountAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if < 10,000" do
      create(:post, user: user)
      expect(SilverWordCountAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 10,000" do
      content = "Lorem " * 1000
      10.times do
        create(:post, user: user, content: content)
      end
      expect(SilverWordCountAchievement.earned_by?(user)).to eq(true)
    end
  end
end
