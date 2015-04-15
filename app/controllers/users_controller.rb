class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @profile = Profile.new(@user, view_context)
  end

  def stats
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @profile = Profile.new(@user, view_context)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      WelcomeEmailJob.perform_later(@user)
      set_current_user(@user.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
