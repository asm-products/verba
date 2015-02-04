class AchievementAwarder
  def self.check_achievements_for(user)
    Achievement.descendants.inject([]) do |achievements_earned, descendant|
      if descendant.earned_by?(user)
        unless descendant.find_by(user_id: user.id)
          achievement = descendant.create!(user: user)
          achievements_earned << achievement
        end
      end
      achievements_earned
    end
  end
end
