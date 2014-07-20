class User < ActiveRecord::Base
  has_many :posts do
    def today
      (where "created_at >= ?", Time.zone.now.beginning_of_day).first
    end
  end

  has_secure_password

  def streak
    @posts = posts.order("created_at DESC")
    previous = @posts.first.created_at.day
    @posts.pluck(:created_at).map(&:day).slice_before do |current|
      previous, previous2 = current, previous
      previous2 - 1 != previous
    end.to_a.max.count
  end

  def increment_longest_streak
    streak_number = streak
    if streak_number >= longest_streak
      update_attribute(:longest_streak, streak_number)
    end
  end
end
