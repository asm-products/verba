require 'rails_helper'

describe BronzePointsAchievement do 
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not < 10" do
      create(:post, user: user)
      expect(BronzePointsAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if points >= 10" do
      content = "Lorem " * 1000
      5.times do
        create(:post, user: user, content: content)
      end
      user.update_points
      expect(BronzePointsAchievement.earned_by?(user)).to eq(true)
    end
  end
end
