class ReminderEmailJob < ActiveJob::Base
  queue_as :reminder_email

  def perform(user)
		 ReminderMailer.send_reminder(user).deliver
  end
end
