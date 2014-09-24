class BronzeWordCountAchievement < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 1000
  end
end
