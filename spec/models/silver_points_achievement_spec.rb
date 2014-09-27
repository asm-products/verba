require 'spec_helper'

describe SilverPointsAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not < 20" do
      Post.create(word_count: 500, user_id: user.id)
      expect(SilverPointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if >= 20" do 
      10.times do
        Post.create(word_count: 1000, user_id: user.id)
      end
      user.increment_points
      expect(SilverPointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
