class WelcomeEmailJob < ActiveJob::Base
  queue_as :welcome_email

  def perform(user, prompt_content)
    WelcomeMailer.send_welcome(user, prompt_content).deliver_now
  end
end
