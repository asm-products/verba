class ReminderMailer < ActionMailer::Base
  default from: "reminder@verba-app.com"

  def send_reminder(user)
    @user = user
    @reminder_copy = ReminderCopy.copy_for(user)
    mail(to: user.email, subject: @reminder_copy.try(:subject))
  end
end
