class GoldPointsAchievement < Achievement
  def self.earned_by?(user)
    user.points >= 50
  end
end
