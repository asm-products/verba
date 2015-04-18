class Wordsmith < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 100_000
  end

  def name
    "Wordsmith"
  end

  def tier
    :gold
  end

  def description
    "You have written 100,000 words!"
  end
end
