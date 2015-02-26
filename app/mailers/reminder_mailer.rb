class ReminderMailer < ActionMailer::Base
  default from: "reminder@verba-app.com"

  def send_reminder(user)
    @user = user
    @reminder_copy = ReminderCopy.copy_for(user) || DefaultReminderCopy.new
    mail(to: user.email, subject: @reminder_copy.subject)
  end
end
