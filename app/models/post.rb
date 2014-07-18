class Post < ActiveRecord::Base
  belongs_to :user

  def date
    created_at.strftime("%e %B %Y")
  end
end
