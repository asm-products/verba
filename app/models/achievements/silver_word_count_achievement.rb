class SilverWordCountAchievement < Achievement
  def self.earned_by?(user)
    user.posts.sum(:word_count) >= 10_000
  end
end
