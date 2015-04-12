class Creator < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 5_000
  end

  def name
    "Creator"
  end

  def tier
    :bronze
  end

  def description
    "You have written 5,000 words."
  end
end
