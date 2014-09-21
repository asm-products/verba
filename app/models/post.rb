class Post < ActiveRecord::Base
  after_save :update_points

  belongs_to :user

  def date
    created_at.strftime("%e %B %Y")
  end

  private

  def update_points
    if word_count == 0
      update_column(:points, 0)
    elsif word_count > 0 && word_count < 750
      update_column(:points, 1)
    else
      update_column(:points, 2)
    end
  end
end
