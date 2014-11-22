require 'rails_helper'

describe GoldPointsAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not < 50" do
      create(:post, user: user)

      expect(GoldPointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 50" do
      content = "Lorem " * 1000
      25.times do
        create(:post, user: user, content: content)
      end

      user.increment_points
      expect(GoldPointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
