class PostsController < AuthenticatedController
  def create
    Post.create!(user_id: current_user.id, content: "", word_count: 0)
    current_user.increment_longest_streak
    redirect_to root_path
  end

  def update
    return if params[:content].nil?
    @post = current_user.posts.today

    @post.update_attribute(:content, params[:content])

    current_user.increment_points
    AchievementAwarder.check_achievements_for(current_user)

    respond_to do |format|
      format.js
    end
  end
end
