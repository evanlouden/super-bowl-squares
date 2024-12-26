# frozen_string_literal: true

class SquareComponent < ViewComponent::Base
  def initialize(square)
    @square = square
  end

  private
  attr_reader :square
  delegate :game, :user, to: :square
  delegate :turbo_frame_tag, to: :helpers

  def class_list
    list = %w[flex items-center justify-center h-12 text-center border rounded border-neutral-900]
    list << if user.present?
      %w[bg-white]
    else
      %w[hover:bg-neutral-200 cursor-pointer]
    end
    list.flatten.join(" ")
  end

  def name
    user&.name
  end

  def locked?
    return true if game.locked?
    return false if user.blank?

    helpers.current_user != square.user
  end
end
