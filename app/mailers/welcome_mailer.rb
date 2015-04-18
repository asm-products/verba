class WelcomeMailer < ActionMailer::Base
  default from: "welcome@writeverba.com"

  def send_welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Verba!")
  end
end
