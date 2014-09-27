require 'spec_helper'

describe SilverWordCountAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not earned" do
      Post.create(word_count: 500, user_id: user.id)
      expect(SilverWordCountAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if earned" do 
      10.times do
        Post.create(word_count: 1000, user_id: user.id)
      end
      expect(SilverWordCountAchievement.earned_by?(user)).to eq(true)
    end
  end
end
