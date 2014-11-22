require 'rails_helper'

describe SilverPointsAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not < 20" do
      create(:post, user: user)
      expect(SilverPointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 20" do
      content = "Lorem " * 1000
      10.times do
        create(:post, user: user, content: content)
      end
      user.update_points
      expect(SilverPointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
