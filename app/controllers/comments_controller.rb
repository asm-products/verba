class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.except(:username, :date))
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.js { render js: "alert('success')" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :username, :date)
  end
end
