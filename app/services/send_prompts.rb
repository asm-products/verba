class SendPrompts
  def call
    send_to_users
  end

  def send_to_users
    User.subscribers.find_each do |user|
      begin
        DailyPromptMailerJob.perform_later(user)
      rescue => e
        puts e.message
      end
    end
  end
end
