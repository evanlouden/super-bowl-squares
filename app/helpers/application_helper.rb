module ApplicationHelper
  def display_boolean(value)
    value ? "✅" : "🚫"
  end

  def number_to_currency(value)
    return if value.blank?
    "$#{value}"
  end
end
