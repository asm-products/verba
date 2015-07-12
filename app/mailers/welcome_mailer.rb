class WelcomeMailer < ActionMailer::Base
  default from: "welcome@writeverba.com"

  def send_welcome(user, prompt_content)
    @user = user
    @prompt = prompt_content
    mail(to: user.email, subject: "Welcome to Verba!")
  end
end
