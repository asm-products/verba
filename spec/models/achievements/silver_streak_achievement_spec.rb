require 'rails_helper'

describe SilverStreakAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if < 10" do
      expect(SilverStreakAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if > 10" do 
      user.longest_streak = 10
      user.save!
      expect(SilverStreakAchievement.earned_by?(user)).to eq(true)
    end
  end 
end
