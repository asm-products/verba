module HasStreak
  def streak
    return if posts.blank?
    @posts = posts.order("created_at DESC")
    days = @posts.pluck(:created_at).map(&:day)

    days.each_with_index.inject(1) do |streak, (day, index)|
      streak += 1 if day - 1 == days[index + 1]
      streak
    end
  end
end
