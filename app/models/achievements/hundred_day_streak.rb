class HundredDayStreak < Achievement
  def self.earned_by?(user)
    user.longest_streak >= 100
  end

  def name
    "Ceaseless"
  end

  def tier
    :gold
  end

  def description
    "You have maintained a writing streak of 100 days!"
  end
end
