# frozen_string_literal: true

class CancelIconComponent < ViewComponent::Base
  def initialize(path: nil)
    @path = path || :back
  end

  erb_template <<-ERB
    <%= link_to path, class: class_list do %>
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
      </svg>
    <% end %>
  ERB

  private

  attr_reader :path

  def class_list
    "flex flex-row-reverse px-2 text-gray-700 text-right"
  end
end
