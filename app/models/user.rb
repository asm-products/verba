class User < ActiveRecord::Base
  has_many :posts do
    def today
      (where "created_at >= ?", Time.zone.now.beginning_of_day).first
    end
  end
  has_many :achievements

  has_secure_password
  include HasStreak

  def increment_longest_streak
    current_streak = streak
    if current_streak >= longest_streak
      update_attribute(:longest_streak, current_streak)
    end
  end

  def increment_points
    update(points: posts.sum(:points))
  end
end
