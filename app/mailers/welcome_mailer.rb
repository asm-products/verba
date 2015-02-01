class WelcomeMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Verba!")
  end
end
