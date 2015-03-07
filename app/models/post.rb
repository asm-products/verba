class Post < ActiveRecord::Base
  belongs_to :user

  include PgSearch
  pg_search_scope :search_by_content, against: :content

  def date
    created_at.strftime("%e %B %Y")
  end

  private

  def calculate_word_count
    content.split(" ").count
  end
end
