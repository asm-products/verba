class Profile
  attr_reader :user

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
  end

  def posts
    @user.posts
  end

  def latest_post
    posts.latest_post
  end

  def posts_count
    if @view_context.current_user == @user
      @user.posts.count
    else
      @user.posts.published.count
    end
  end

  def streak
    @user.streak(:posts)
  end
end
