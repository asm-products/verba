class Post < ActiveRecord::Base
  after_save :update_points

  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_content, against: :content

  scope :published, -> { where(published: true) }
  scope :latest_post, -> { order("created_at desc").first }

  def date
    created_at.strftime("%e %B %Y")
  end

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end

  private

  def calculate_word_count
    content.split(" ").count
  end

  def update_points
    update_column(:word_count, calculate_word_count)

    if word_count == 0
      update_column(:points, 0)
    elsif word_count > 0 && word_count < 750
      update_column(:points, 1)
    else
      update_column(:points, 2)
    end
  end
end
