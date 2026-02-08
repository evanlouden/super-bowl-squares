# frozen_string_literal: true

class SquareComponent < ViewComponent::Base
  def initialize(square, current_score_x: nil, current_score_y: nil)
    @square = square
    @current_score_x = current_score_x
    @current_score_y = current_score_y
  end

  private
  attr_reader :square, :current_score_x, :current_score_y
  delegate :id, :game, :user, to: :square
  delegate :turbo_frame_tag, to: :helpers

  def class_list
    list = %w[flex items-center justify-center h-12 text-center border rounded border-neutral-900 truncate]
    list << if current_score_match?
      %w[bg-yellow-300 border-4 border-yellow-600 font-bold shadow-lg]
    elsif user.present?
      if current_user_owns_square?
        %w[bg-blue-400 border-2 border-white shadow-lg]
      else
        %w[bg-white]
      end
    elsif !locked?
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

  def current_score_match?
    current_score_x.present? && current_score_y.present? &&
      square.x == current_score_x &&
      square.y == current_score_y
  end

  def current_user_owns_square?
    helpers.current_user == square.user
  end
end
