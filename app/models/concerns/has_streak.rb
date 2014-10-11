module HasStreak
  def streak(association)
    return if self.send(association).blank?
    @association = self.send(association).order("created_at DESC")
    days = @association.pluck(:created_at).map(&:day)

    days.each_with_index.inject(1) do |streak, (day, index)|
      streak += 1 if day - 1 == days[index + 1]
      streak
    end
  end
end
