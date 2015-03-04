class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @published_posts = @user.posts.published
    @latest_post = @user.posts.latest_post
    @points = @user.points
    @current_streak = @user.streak(:posts)
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
