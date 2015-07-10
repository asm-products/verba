module ApplicationHelper
  def json_for(collection)
    collection.map do |record|
      record.serializable_hash
    end
    collection.to_json
  end

  def flash_message
    flash_message_types = %w(notice error success)
    flash.map do |k, v|
      if flash_message_types.include?(k)
        content_tag(:div, class: "flash-message--#{k}") do
          content_tag(:div, "x", class: "flash-message__close") + v
        end
      end
    end.join.html_safe
  end
end
