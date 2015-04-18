class DailyPromptMailerJob < ActiveJob::Base
  queue_as :daily_prompt_email

  def perform(user)
    DailyPromptMailer.send_prompt(user).deliver
  end
end
