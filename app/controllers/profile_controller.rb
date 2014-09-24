class ProfileController < ApplicationController
  def show
    @post_today = current_user.posts.today
    @posts = current_user.posts 
    @points = current_user.points
    @current_streak = current_user.streak
  end
end
