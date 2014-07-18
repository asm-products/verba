class User < ActiveRecord::Base
  has_many :posts do
    def today
      where "created_at >= ?", Time.zone.now.beginning_of_day
    end
  end

  has_secure_password
end
