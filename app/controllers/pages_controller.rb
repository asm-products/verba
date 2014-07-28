class PagesController < AuthenticatedController
  def writing
    @post_today = current_user.posts.today
    @prompt ||= session[:prompt]
  end

  def profile
    @post_today = current_user.posts.today
    @posts = current_user.posts
    @points = @posts.sum(:points)
    @current_streak = current_user.streak
  end

  def archive
    @posts = current_user.posts.order("created_at DESC")
  end

  def new_prompt
    session[:prompt] = WritingPrompt.all.pluck(:prompt).sample
  end
end
