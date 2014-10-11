class User < ActiveRecord::Base
  has_many :posts do
    def today
      (where "created_at >= ?", Time.zone.now.beginning_of_day).first
    end
  end
  has_many :achievements

  has_secure_password

  def streak
    return if posts.blank?
    @posts = posts.order("created_at DESC")
    days = @posts.pluck(:created_at).map(&:day)

    days.each_with_index.inject(1) do |streak, (day, index)|
      streak += 1 if day - 1 == days[index + 1]
      streak
    end
  end

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
