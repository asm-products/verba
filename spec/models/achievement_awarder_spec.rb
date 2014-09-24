require 'rails_helper'

describe AchievementAwarder do
  let (:user) { create(:user) }

  it "should award bronze word count" do
    Post.create(user_id: user.id, word_count: 1000)
    AchievementAwarder.check_achievements_for(user)
    expect(user.achievements.first).to be_a BronzeWordCountAchievement
  end
end
