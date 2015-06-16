class Post < ActiveRecord::Base
  include DateFormat
  
  before_save :prevent_blank_content

  after_save :calculate_word_count

  belongs_to :user
  belongs_to :prompt

  has_many :comments

  include PgSearch
  pg_search_scope :search_by_content, against: :content

  scope :published,     -> { where(published: true) }
  scope :latest_post,   -> { order("created_at desc").first || NullPost.new }
  scope :on_date, -> (day) { where("created_at >= ? AND created_at <= ?",
                             day.beginning_of_day,
                             day.end_of_day) }

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end

  private

  def prevent_blank_content
    return /^\s*$/ =~ content ? false : true
  end

  def calculate_word_count
    update_column(:word_count, (content || "").split(" ").count)
  end
end
