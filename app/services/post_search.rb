class PostSearch
  def self.search(search_term, user)
    search = self.new
    search.search_content(search_term, user)
  end

  def search_content(search_term, user)
    Post.where(user: user)
        .search_by_content(search_term)
        .order("created_at DESC")
  end
end
