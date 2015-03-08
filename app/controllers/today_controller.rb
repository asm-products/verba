class TodayController < AuthenticatedController
  def show
    @post_today = current_user.posts.today
    @profile = Profile.new(current_user, view_context)
  end
end
