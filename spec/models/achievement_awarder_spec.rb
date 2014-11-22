require 'rails_helper'

describe AchievementAwarder do
  let (:user) { create(:user) }

  it "should award bronze word count" do
    content = "Lorem " * 1000
    create(:post, content: content, user: user)
    AchievementAwarder.check_achievements_for(user)
    expect(user.achievements.first).to be_a BronzeWordCountAchievement
  end
end
