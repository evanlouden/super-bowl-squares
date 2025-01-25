module ApplicationHelper
  def display_boolean(value)
    value ? "✅" : "🚫"
  end

  def number_to_currency(value)
    "$#{value}"
  end
end
