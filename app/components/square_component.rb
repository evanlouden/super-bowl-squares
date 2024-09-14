# frozen_string_literal: true

class SquareComponent < ViewComponent::Base
  def initialize(square)
    @square = square
  end

  private
  attr_reader :square
  delegate :locked?, to: :square
  delegate :user, to: :square
  delegate :name, to: :user

  def class_list
    list = %w[flex items-center justify-center h-12 text-center border rounded border-neutral-900]
    list << if locked? || name.present?
      %w[bg-white]
    else
      %w[hover:bg-neutral-200 cursor-pointer]
    end
    list.flatten.join(" ")
  end
end
