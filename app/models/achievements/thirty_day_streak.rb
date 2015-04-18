class ThirtyDayStreak < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 30
  end

  def name
    "Persistent"
  end

  def tier
    :silver
  end

  def description
    "You have maintained a writing streak of 30 days."
  end
end
