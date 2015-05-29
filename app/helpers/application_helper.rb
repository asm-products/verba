module ApplicationHelper
  def json_for(collection)
    collection.map do |record|
      record.serializable_hash
    end
    collection.to_json
  end
end
