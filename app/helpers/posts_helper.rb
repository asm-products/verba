module PostsHelper
  def render_posts(posts, show_link: false)
    render partial: 'posts/post', collection: posts, locals: { show_link: show_link }
  end
end
