class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    @password_reset = PasswordReset.new(user_id: user.id)

    if @password_reset.save
      PasswordResetsMailer.send_reset(user, @password_reset).deliver

      redirect_to new_password_reset_path, notice: "Check your email for your password reset link."
    end
  end

  def edit
    @password_reset = PasswordReset.find_by(token: params[:token])
    @user = @password_reset.user
  end

  def update
    @password_reset = PasswordReset.find_by(token: params[:token])
    @user = @password_reset.user

    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      redirect_to login_path, notice: "Password successfully reset!"
    else
      redirect_to edit_password_reset_path(@password_reset, token: @password_reset.token)
    end
  end
end
