module MembersHelper
  # a helper to generate error messages
  # @params model [Object]
  # @params field [Symbol] current form field name
  def error_message(model, field)
    return nil if model.errors.messages[field].blank?

    message = "#{field.to_s.titleize} #{model.errors.messages[field].first}"
    content_tag :div, message, class: 'error'
  end
end
