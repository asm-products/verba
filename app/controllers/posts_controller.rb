class PostsController < AuthenticatedController
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @profile = Profile.new(@post.user, view_context)
    redirect_to user_path(current_user) unless @post.user == current_user || @post.published?
  end

  def create
    Post.create!(user_id: current_user.id,
                 content: nil,
                 word_count: 0,
                 prompt_id: Prompt.today.id)
    current_user.update_longest_streak
    redirect_to write_path
  end

  def update
    @post = current_user.posts.today

    @post.content = post_params[:content]

    if @post.save
      @achievements = AchievementAwarder.check_achievements_for(current_user)
      flash[:achievement] = @achievements.map(&:name).zip(@achievements.map(&:tier)) unless @achievements.blank?
      respond_to do |format|
        format.js { render :action => 'update_success' }
        format.html { redirect_to profile_path }
      end
    else
      respond_to do |format|
        format.js { render :action => 'update_failure' }
        format.html {
          @post.delete
          flash[:notice] = "Your blank post was not saved. Remember: blank posts don't count!" 
          redirect_to profile_path
        }
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
