class BronzeStreakAchievement < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 2
  end

  def name
    "Two in a row"
  end

  def tier
    :bronze
  end

  def description
    "You maintained a writing streak of two days."
  end
end
