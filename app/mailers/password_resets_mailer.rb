class PasswordResetsMailer < ActionMailer::Base
  default from: "password_reset@writeverba.com"

  def send_reset(user, password_reset)
    @user = user
    @password_reset = password_reset

    mail(to: user.email, subject: "Verba password reset")
  end
end
