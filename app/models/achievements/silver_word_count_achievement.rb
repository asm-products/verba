class SilverWordCountAchievement < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 10_000
  end

  def name
    "Scribe"
  end

  def tier
    :silver
  end

  def description
    "You have writen 10,000 words."
  end
end
