class ArchiveController < ApplicationController 
  def index
    @posts = Post.where(user: current_user)
      .paginate(page: params[:page], per_page: 10)
      .order('created_at DESC')
  end

  def download
    post = Post.find(params[:id])
    content = post.content
    send_data content, filename: "Writing from #{post.date}"
  end
end
