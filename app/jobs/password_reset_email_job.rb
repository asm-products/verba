class PasswordResetEmailJob < ActiveJob::Base
  queue_as :password_reset_email

  def perform(user, password_reset)
    PasswordResetsMailer.send_reset(user, password_reset).deliver
  end
end
