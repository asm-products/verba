class PostsController < AuthenticatedController
  def create
    Post.create(user_id: current_user.id, content: "", word_count: 0)
    redirect_to root_path
  end
end
