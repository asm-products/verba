class PostsController < AuthenticatedController
  def create
    Post.create(user_id: current_user.id, content: "", word_count: 0)
    redirect_to root_path
  end

  def update
    @post = current_user.posts.today.first

    @post.update_attribute(:word_count, params[:word_count])
    @post.update_attribute(:content, params[:content])

    respond_to do |format|
      format.js
    end
  end
end
