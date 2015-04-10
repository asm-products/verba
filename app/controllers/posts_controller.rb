class PostsController < AuthenticatedController
  def show
    @post = Post.find(params[:id])
    @profile = Profile.new(current_user, view_context)
  end

  def create
    Post.create!(user_id: current_user.id,
                 content: "",
                 word_count: 0,
                 prompt_id: Prompt.today.id)
    current_user.update_longest_streak
    redirect_to root_path
  end

  def update
    @post = current_user.posts.today

    @post.content = post_params[:content]

    if @post.save
      @achievements = AchievementAwarder.check_achievements_for(current_user)
      flash[:achievement] = @achievements.map(&:name).zip(@achievements.map(&:tier)) unless @achievements.blank?
      respond_to do |format|
        format.js
        format.html { redirect_to profile_path }
      end
    end
  end

  def publish
    post = current_user.posts.find(params[:post_id])
    post.publish

    redirect_to user_path(post.user)
  end

  def unpublish
    post = current_user.posts.find(params[:post_id])
    post.unpublish

    redirect_to user_path(post.user)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
