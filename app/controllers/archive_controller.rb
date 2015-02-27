class ArchiveController < ApplicationController
  def index
    @posts = if params[:search]
               PostSearch.search(params[:search], current_user)
                         .paginate(page: params[:page], per_page: 10)
             else
               Post.where(user: current_user)
                    .paginate(page: params[:page], per_page: 10)
                    .order('created_at DESC')
             end
  end

  def download
    post = current_user.posts.find(params[:id])
    content = post.content
    send_data content, filename: "Writing from #{post.date}"
  end
end
