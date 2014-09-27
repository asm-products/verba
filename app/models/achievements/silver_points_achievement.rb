class SilverPointsAchievement < Achievement
  def self.earned_by?(user)
    user.points >= 20
  end
end
