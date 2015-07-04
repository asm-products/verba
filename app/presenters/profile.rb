class Profile
  attr_reader :user

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
  end

  def posts
    if current_users_profile?
      @user.posts.order("created_at DESC")
        .paginate(page: @view_context.params[:page], per_page: 10)
    elsif @user.posts.published.present?
      @user.posts.published.order("created_at DESC")
        .paginate(page: @view_context.params[:page], per_page: 10)
    else
      @user.posts.none
    end
  end

  def latest_post
    @user.posts.latest_post
  end

  def posts_count
    @user.posts.count
  end

  def streak
    @user.streak(:posts)
  end

  def current_users_profile?
    @view_context.current_user == @user
  end

  def days_of_the_week
    ((DateTime.now - 7)..DateTime.now)
  end

  def refund_button
    if @user.eligible_for_refund?
      @view_context.link_to "Refund!", @view_context.refunds_path, class: "button breathe__bottom", method: :post
    else
      @view_context.link_to "Refund!", "#", class: "button--disabled breathe__bottom"
    end
  end
end
