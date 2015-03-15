module PostsHelper
  def render_posts(posts, show_link: false)
    if posts.present?
      render partial: 'posts/post', collection: posts,
        locals: { show_link: show_link }
    else
      render partial: 'posts/post_blank_state'
    end
  end
end
