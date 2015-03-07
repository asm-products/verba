class ProfileController < ApplicationController
  def show
    @post_today = current_user.posts.today
    @post_count = current_user.posts.count
    @current_streak = current_user.streak(:posts)
  end
end
