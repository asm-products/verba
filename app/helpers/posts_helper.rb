module PostsHelper
  def posted_date(post)
    l post.created_at, format: :post
  end

  def render_posts(posts, show_link: false)
    render partial: 'posts/post', collection: posts, locals: { show_link: show_link }  
  end

end
