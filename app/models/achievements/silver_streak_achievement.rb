class SilverStreakAchievement < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 10
  end
end
