module UsersHelper
  def add_errors_of(errors, field)
    if errors.include?(field)
      errors.full_messages_for(field).each do |msg|
        concat(content_tag(:div, msg, class: 'error-msg'))
      end
    end
  end
end
