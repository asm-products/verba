require 'spec_helper'

describe BronzeWordCountAchievement do
  let(:user) { create(:user) }

  context "earned_by?" do
    it "returns false if not earned" do
      Post.create(word_count: 500, user_id: user.id)
      expect(BronzeWordCountAchievement.earned_by?(user)).to eq(false)
    end

    it "returns true if earned" do 
      Post.create(word_count: 1000, user_id: user.id)
      expect(BronzeWordCountAchievement.earned_by?(user)).to eq(true)
    end
  end
end
