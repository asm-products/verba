class ReminderMailer < MandrillMailer::TemplateMailer
  default from: "reminder@verba-app.com"

  def send_reminder(user)
    mandrill_mail(build_mail(to: [user],
                             reminder_copy: ReminderCopy.copy_for(user)))
  end

  private
  def build_mail(fields)
    reminder_copy = fields.delete(:reminder_copy)

    # Required fields
    fields[:to].map!{ |user| {email: user.email, name: user.username} }
    fields[:template] = 'daily-reminder'
    fields[:template_content] = []
    fields[:subject] = reminder_copy.subject
    fields[:vars] = {
      "ACTION" => reminder_copy.action,
      "CONTENT" => reminder_copy.copy,
      "WEEK" => reminder_copy.week,
      "DAY" => reminder_copy.day
    }

    fields
  end
end
