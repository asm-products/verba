class AchievementAwarder
  def self.check_achievements_for(user)
    Achievement.descendants.each do |descendant|
      if descendant.earned_by?(user)
        descendant.first_or_create!(user_id: user.id)
      end
    end
  end
end
