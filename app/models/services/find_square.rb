# frozen_string_literal: true

class Services::FindSquare
  def initialize(game)
    @game = game
  end

  delegate :x_axis_score, :y_axis_score, to: :first_quarter, prefix: true
  delegate :x_axis_score, :y_axis_score, to: :second_quarter, prefix: true, allow_nil: true
  delegate :x_axis_score, :y_axis_score, to: :third_quarter, prefix: true, allow_nil: true
  delegate :x_axis_score, :y_axis_score, to: :final, prefix: true, allow_nil: true

  def first_quarter_winner_name
    return if first_quarter.blank?

    first_quarter_score_square_name || "🚫 ➡️"
  end

  def second_quarter_winner_name
    return if second_quarter.blank?

    if first_quarter_winner_name.blank? && second_quarter_score_square_name.present?
      "#{second_quarter_score_square_name} + ⬅️"
    elsif second_quarter_score_square_name.present?
      second_quarter_score_square_name
    else
      "🚫 ➡️"
    end
  end

  def third_quarter_winner_name
    return if third_quarter.blank?

    if second_quarter_winner_name.blank? && third_quarter_score_square_name.present?
      "#{third_quarter_score_square_name} + ⬅️"
    elsif third_quarter_score_square_name.present?
      third_quarter_score_square_name
    else
      "🚫 ➡️"
    end
  end

  def final_winner_name
    return if final.blank?

    final_score_square_name || "🚫 ➡️"
  end

  def first_quarter_score_square_name
    return @first_quarter_score_square_name if defined?(@first_quarter_score_square_name)

    @first_quarter_score_square_name = game.squares.find_by(
      x: x_coordinate(find_last_digit(first_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(first_quarter_y_axis_score))
    ).user_name
  end

  def second_quarter_score_square_name
    return @second_quarter_score_square_name if defined?(@second_quarter_score_square_name)

    @second_quarter_score_square_name = game.squares.find_by(
      x: x_coordinate(find_last_digit(second_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(second_quarter_y_axis_score))
    ).user_name
  end

  def third_quarter_score_square_name
    return @third_quarter_score_square_name if defined?(@third_quarter_score_square_name)

    @third_quarter_score_square_name = game.squares.find_by(
      x: x_coordinate(find_last_digit(third_quarter_x_axis_score)),
      y: y_coordinate(find_last_digit(third_quarter_y_axis_score))
    ).user_name
  end

  def final_score_square_name
    return @final_score_square_name if defined?(@final_score_square_name)

    @final_score_square_name = game.squares.find_by(
      x: x_coordinate(find_last_digit(final_x_axis_score)),
      y: y_coordinate(find_last_digit(final_y_axis_score))
    ).user_name
  end

  def first_quarter_score_square_amount
    return if first_quarter.blank?

    "$#{game.first_quarter_payout * game.total_squares_amount}"
  end

  def second_quarter_score_square_amount
    return if second_quarter.blank?

    "$#{game.second_quarter_payout * game.total_squares_amount}"
  end

  def third_quarter_score_square_amount
    return if third_quarter.blank?

    "$#{game.third_quarter_payout * game.total_squares_amount}"
  end

  def final_score_square_amount
    return if final.blank?

    "$#{game.final_payout * game.total_squares_amount}"
  end

  private

  attr_reader :game

  def first_quarter
    return @first_quarter if defined?(@first_quarter)

    @first_quarter = Score.first_quarter
  end

  def second_quarter
    return @second_quarter if defined?(@second_quarter)

    @second_quarter = Score.second_quarter
  end

  def third_quarter
    return @third_quarter if defined?(@third_quarter)

    @third_quarter = Score.third_quarter
  end

  def final
    return @final if defined?(@final)

    @final = Score.final
  end

  def unlocked?
    !game.locked?
  end

  def show_first_quarter_score?
    first_quarter_score.present?
  end

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
