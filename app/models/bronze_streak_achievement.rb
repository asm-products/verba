class BronzeStreakAchievement < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 5
  end
end
