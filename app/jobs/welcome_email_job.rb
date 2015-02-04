class WelcomeEmailJob < ActiveJob::Base
  queue_as :welcome_email

  def perform(user)
    WelcomeMailer.send_welcome(user).deliver_now
  end
end
