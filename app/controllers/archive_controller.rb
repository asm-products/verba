class ArchiveController < ApplicationController 
  def index
    @posts = current_user.posts.order("created_at DESC")
  end

  def download
    post = Post.find(params[:id])
    content = post.content
    send_data content, filename: "Writing from #{post.date}"
  end
end
