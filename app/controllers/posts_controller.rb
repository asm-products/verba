class PostsController < AuthenticatedController
  def create
    Post.create!(user_id: current_user.id, content: "", word_count: 0)
    current_user.increment_longest_streak
    from = "+18457649208"
    to = "+19144825484"
    begin
      client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
      client.account.sms.messages.create(from: from, to: to, body: "Hello World")
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
    redirect_to root_path
  end

  def update
    @post = current_user.posts.today
    return if params[:word_count].nil? || params[:content].nil?

    # FIXME
    @post.update_attribute(:word_count, params[:word_count].first.to_i)
    @post.update_attribute(:content, params[:content])

    respond_to do |format|
      format.js
    end
  end
end
