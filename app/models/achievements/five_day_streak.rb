class FiveDayStreak < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 5
  end

  def name
    "Steady"
  end

  def tier
    :bronze
  end

  def description
    "You maintained a writing streak of five days."
  end
end
