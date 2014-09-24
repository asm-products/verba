class PostsController < AuthenticatedController
  def create
    Post.create!(user_id: current_user.id, content: "", word_count: 0)
    current_user.increment_longest_streak
    redirect_to root_path
  end

  def update
    @post = current_user.posts.today
    return if params[:word_count].nil? || params[:content].nil?

    # FIXME
    @post.update_attribute(:word_count, params[:word_count].first.to_i)
    @post.update_attribute(:content, params[:content])
    AchievementAwarder.check_achievements_for(current_user)

    respond_to do |format|
      format.js
    end
  end
end
