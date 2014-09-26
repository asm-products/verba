class TodayController < AuthenticatedController
  def show
    @post_today = current_user.posts.today
  end
end
