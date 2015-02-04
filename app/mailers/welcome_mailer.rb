class WelcomeMailer < ActionMailer::Base
  default from: "welcome@verba-app.com"

  def send_welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Verba!")
  end
end
