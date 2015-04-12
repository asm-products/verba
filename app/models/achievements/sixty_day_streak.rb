class SixtyDayStreak < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 60
  end

  def name
    "Unfailing"
  end

  def tier
    :gold
  end

  def description
    "You have maintained a writing streak of 60 days."
  end
end
