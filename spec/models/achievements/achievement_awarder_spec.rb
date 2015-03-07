require 'rails_helper'

xdescribe AchievementAwarder do
  let (:user) { create(:user) }

  context ".check_achievments_for" do
    it "should award bronze word count" do
      content = "Lorem " * 1000
      create(:post, content: content, user: user)
      expect(AchievementAwarder.check_achievements_for(user).first.class).to eq(BronzeWordCountAchievement)
    end
  end
end
