class GetSynonyms
  def initialize(word)
    @word = word
  end

  def self.call(word)
    service = new(word)
    service.get_synonyms
  end

  def get_synonyms
    url = "#{ENV["WORDS_API_URL"] + @word}/synonyms"
    response = Unirest.get url,
      headers: {
        "X-Mashape-Key" => ENV["WORDS_API_KEY"],
        "Accept" => "application/json"
      }
  end
end
