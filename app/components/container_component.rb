# frozen_string_literal: true

class ContainerComponent < ViewComponent::Base
  erb_template <<-ERB
    <div class="<%= class_list %>"><%= content %></div>
  ERB

  def class_list
    "container max-w-sm"
  end
end
