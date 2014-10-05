require 'rails_helper'

describe GoldPointsAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not < 50" do
      Post.create(word_count: 500, user_id: user.id)
      expect(GoldPointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 50" do
      25.times do
        Post.create(word_count: 1000, user_id: user.id)
      end
      user.increment_points
      expect(GoldPointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
