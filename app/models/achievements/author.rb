class Author < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 200_000
  end

  def name
    "Author"
  end

  def tier
    :gold
  end

  def description
    "You have written 200,000 words!"
  end
end
