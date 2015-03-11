class User < ActiveRecord::Base
  has_many :posts do
    def today
      (where "created_at >= ?", Time.zone.now.beginning_of_day).first
    end
  end

  validates :username, :email, uniqueness: true, presence: true
  validates :email, format: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates :password, length: { minimum: 8 }

  has_many :achievements
  has_secure_password
  has_streak

  def update_longest_streak
    current_streak = streak(:posts)
    if current_streak >= longest_streak
      update_attribute(:longest_streak, current_streak)
    end
  end

  def days_since_registration
    (Date.today - created_at.to_date).to_i
  end

  def weeks_since_registration
    days_since_registration / 7
  end

  def week_day_since_registration
    days_since_registration % 7
  end
end
