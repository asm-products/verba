class PagesController < AuthenticatedController
  def writing
    @post_today = current_user.posts.today
    @prompt ||= session[:prompt]
  end 
end
