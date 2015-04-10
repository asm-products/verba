class BronzeWordCountAchievement < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 1000
  end

  def name
    "Fledgling"
  end

  def tier
    :bronze
  end

  def description
    "You have writen 1,000 words."
  end
end
