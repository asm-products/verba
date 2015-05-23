class Comment < ActiveRecord::Base
  include DateFormat

  belongs_to :user
  belongs_to :post

  delegate :username, to: :user
end
