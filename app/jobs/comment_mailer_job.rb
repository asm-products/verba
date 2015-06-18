class CommentMailerJob < ActiveJob::Base
  queue_as :comment_email

  def perform(comment_user, comment)
    CommentMailer.send_comment_mail(comment_user, comment).deliver_now
  end
end
