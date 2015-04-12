class Essayist < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 50_000
  end

  def name
    "Essayist"
  end

  def tier
    :silver
  end

  def description
    "You have written 50,000 words."
  end
end
