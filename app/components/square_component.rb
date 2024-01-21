# frozen_string_literal: true

class SquareComponent < ViewComponent::Base
  def initialize(square)
    @square = square
  end

  private
  attr_reader :square
  delegate :locked?, to: :square

  def user_id
    square.user.present? ? nil : 1
  end

  def name
    square.user.present? ? square.user.name : nil
  end
end
