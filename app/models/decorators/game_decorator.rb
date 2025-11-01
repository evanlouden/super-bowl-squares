# frozen_string_literal: true

class Decorators::GameDecorator < SimpleDelegator
  def initialize(game)
    super(game)
    @game = game
    @scores = Score.quarter_scores
    @first_quarter = @scores.find { |score| score.quarter == 1 }
    @second_quarter = @scores.find { |score| score.quarter == 2 }
    @third_quarter = @scores.find { |score| score.quarter == 3 }
    @fourth_quarter = @scores.find { |score| score.quarter == 4 }
  end

  delegate :x_axis_score, :y_axis_score, to: :first_quarter, prefix: true, allow_nil: true
  delegate :x_axis_score, :y_axis_score, to: :second_quarter, prefix: true, allow_nil: true
  delegate :x_axis_score, :y_axis_score, to: :third_quarter, prefix: true, allow_nil: true
  delegate :x_axis_score, :y_axis_score, to: :fourth_quarter, prefix: true, allow_nil: true


  def first_winner
    return if first_quarter.blank?
    return first_square.user.name if first_square.user.present?
    return "🚫 ➡️" if second_quarter.blank? || second_square.user.present? || third_square.user.present? || fourth_square.user.present?
    "🚫"
  end

  def second_winner
    return if second_quarter.blank?
    return second_square.user.name if second_square.user.present?
    return "🚫 ➡️" if third_quarter.blank? || third_square.user.present? || fourth_square.user.present?
    return "⬅️ 🚫" if first_square.user.present?
    "🚫"
  end

  def third_winner
    return if third_quarter.blank?
    return third_square.user.name if third_square.user.present?
    return "🚫 ➡️" if fourth_square.user.present? || fourth_quarter.blank?
    return "⬅️ 🚫" if second_square.user.present? || first_square.user.present?
    "🚫" if fourth_square.user.blank?
  end

  def fourth_winner
    return if fourth_quarter.blank?
    return fourth_square.user.name if fourth_square.user.present?
    return "⬅️ 🚫" if third_square.user.present? || second_square.user.present? || first_square.user.present?

    "🚫"
  end

  def first_square
    return @first_square if defined?(@first_square)

    @first_square = game.squares.find_by(
      x: x_coordinate(find_last_digit(first_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(first_quarter_y_axis_score))
    )
  end

  def second_square
    return @second_square if defined?(@second_square)

    @second_square = game.squares.find_by(
      x: x_coordinate(find_last_digit(second_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(second_quarter_y_axis_score))
    )
  end

  def third_square
    return @third_square if defined?(@third_square)

    @third_square = game.squares.find_by(
      x: x_coordinate(find_last_digit(third_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(third_quarter_y_axis_score))
    )
  end

  def fourth_square
    return @fourth_square if defined?(@fourth_square)

    @fourth_square = game.squares.find_by(
      x: x_coordinate(find_last_digit(fourth_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(fourth_quarter_y_axis_score))
    )
  end

  def first_amount
    return if first_quarter.blank?

    (first_quarter_payout * 0.01 * total_squares_amount).to_i
  end

  def second_amount
    return if second_quarter.blank?

    (second_quarter_payout * 0.01 * total_squares_amount).to_i
  end

  def third_amount
    return if third_quarter.blank?

    (third_quarter_payout * 0.01 * total_squares_amount).to_i
  end

  def fourth_amount
    return if fourth_quarter.blank?

    total_squares_amount - first_amount - second_amount - third_amount
  end

  def payouts
    @payouts ||= Services::FindPayouts.new(game).call
  end

  private

  attr_reader :game, :first_quarter, :second_quarter, :third_quarter, :fourth_quarter

  delegate(
    :total_squares_amount,
    :first_quarter_payout,
    :second_quarter_payout,
    :third_quarter_payout,
    :final_payout,
    to: :game
  )

  def x_coordinate(value)
    headers.find { |header| header.value == value && header.axis == "x" }.position
  end

  def y_coordinate(value)
    headers.find { |header| header.value == value && header.axis == "y" }.position
  end

  def headers
    @headers ||= game.headers
  end

  def find_last_digit(score)
    score.to_s[-1].to_i
  end
end
