class ProfileController < ApplicationController
  def show 
    @post_today = current_user.posts.today
    @posts = current_user.posts
    # FIXME should be a column on user model
    @points = @posts.sum(:points)
    @current_streak = current_user.streak
  end
end
