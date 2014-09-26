module ArchiveHelper
  def markdown_format(post)
    simple_format(RDiscount.new(post.content || '').to_html)
  end
end
