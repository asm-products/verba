class Comment < ActiveRecord::Base
  include DateFormat

  belongs_to :user
  belongs_to :post

  def serializable_hash(options = nil)
    {
      username: user.username,
      content: content,
      date: date
    }
  end
end
