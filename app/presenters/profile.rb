class Profile
  attr_reader :user

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
  end

  def posts
    if current_users_profile?
      @user.posts.order("created_at DESC")
    else
      @user.posts.published.order("created_at DESC")
    end
  end

  def latest_post
    @user.posts.latest_post
  end

  def posts_count
    if current_users_profile?
      @user.posts.count
    else
      @user.posts.published.count
    end
  end

  def streak
    @user.streak(:posts)
  end

  def current_users_profile?
    @view_context.current_user == @user
  end
end
