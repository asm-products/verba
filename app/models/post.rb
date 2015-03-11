class Post < ActiveRecord::Base
  after_save :calculate_word_count

  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_content, against: :content

  def date
    created_at.strftime("%e %B %Y")
  end

  private

  def calculate_word_count
    update_column(:word_count, content.split(" ").count)
  end
end
