class PagesController < ApplicationController
  before_action :require_user

  def writing
  end

  def profile
    @posts = current_user.posts
    @points = @posts.sum(:points)
  end

  def archive
    @posts = current_user.posts
  end
end
