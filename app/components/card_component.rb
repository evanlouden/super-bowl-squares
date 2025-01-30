# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="<%= class_list %>"><%= content %></div>
  ERB

  def class_list
    "p-4 bg-white border rounded shadow-md"
  end
end
