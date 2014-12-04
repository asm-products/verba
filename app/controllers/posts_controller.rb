class PostsController < AuthenticatedController
  def create
    Post.create!(user_id: current_user.id, content: "", word_count: 0)
    current_user.update_longest_streak
    redirect_to root_path
  end

  def update
    @post = current_user.posts.today

    @post.content = post_params[:content]

    if @post.save
      current_user.update_points
      @achievements = AchievementAwarder.check_achievements_for(current_user)
      flash[:achievement] = @achievements unless @achievements.blank?
      redirect_to profile_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
