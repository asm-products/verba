require 'spec_helper'

describe BronzeStreakAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if < 5" do
      expect(BronzeStreakAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if > 5" do 
      user.longest_streak = 5
      user.save!
      expect(BronzeStreakAchievement.earned_by?(user)).to eq(true)
    end
  end
end
