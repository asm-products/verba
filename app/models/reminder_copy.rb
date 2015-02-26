class ReminderCopy < ActiveRecord::Base
  def self.copy_for(user)
    where(week: user.weeks_since_registration, day: user.week_day_since_registration).first
  end
end
