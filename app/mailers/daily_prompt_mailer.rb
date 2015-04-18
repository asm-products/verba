class DailyPromptMailer < ActionMailer::Base
  default from: "daily-prompt@writeverba.com"

  def send_prompt(user)
    @user = user
    @prompt = Prompt.today
    mail(to: user.email, subject: "Today's writing prompt")
  end
end
