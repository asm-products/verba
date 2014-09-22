class Achievement < ActiveRecord::Base
  belongs_to :user

  def self.earned_by?(user)
    raise 'Override this in a child class.'
  end
end
