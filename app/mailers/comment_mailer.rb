class CommentMailer < ActionMailer::Base

  default from: "comments@writeverba.com"

  def send_comment_mail(comment_user, comment)
    @comment_user = comment_user
    @comment = comment
    @post = Post.find(@comment.post_id)
    @post_url = post_url(@post)
    mail(to: @post.user.email, subject: comment_user.username + " commented on your post")
  end
end
