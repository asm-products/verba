class BronzePointsAchievement < Achievement
  def self.earned_by?(user)
    user.points >= 10
  end
end
