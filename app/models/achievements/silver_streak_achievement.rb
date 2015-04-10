class SilverStreakAchievement < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 10
  end

  def name
    "Consistent"
  end

  def tier
    :silver
  end

  def description
    "You have maintained a writing streak of 10 days."
  end
end
