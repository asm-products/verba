class PagesController < AuthenticatedController
  def writing
    @post_today = current_user.posts.today
    @prompt ||= session[:prompt]
  end

  def archive
    @posts = current_user.posts.order("created_at DESC")
  end

  def download
    post = Post.find(params[:id])
    content = post.content
    send_data content, filename: "Writing from #{post.date}"
  end
end
