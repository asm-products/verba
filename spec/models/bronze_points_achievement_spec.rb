require 'spec_helper'

describe BronzePointsAchievement do 
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not earned" do
      Post.create(word_count: 500, user_id: user.id)
      expect(BronzePointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if earned" do 
      10.times do
        Post.create(word_count: 1000, user_id: user.id)
      end
      user.increment_points
      expect(BronzePointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
