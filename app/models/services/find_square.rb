# frozen_string_literal: true

class Services::FindSquare
  def initialize(game)
    @game = game
  end

  def first_quarter_score_square_name
    return if unlocked? || x_axis_first_quarter_score.blank? || y_axis_first_quarter_score.blank?

    game.squares.find_by!(
      x: x_coordinate(find_last_digit(x_axis_first_quarter_score)),
      y: y_coordinate(find_last_digit(y_axis_first_quarter_score))
    ).user_name
  end

  def second_quarter_score_square_name
    return if unlocked? || x_axis_second_quarter_score.blank? || y_axis_second_quarter_score.blank?

    game.squares.find_by!(
      x: x_coordinate(find_last_digit(x_axis_second_quarter_score)),
      y: y_coordinate(find_last_digit(y_axis_second_quarter_score))
    ).user_name
  end

  def third_quarter_score_square_name
    return if unlocked? || x_axis_third_quarter_score.blank? || y_axis_third_quarter_score.blank?

    game.squares.find_by!(
      x: x_coordinate(find_last_digit(x_axis_third_quarter_score)),
      y: y_coordinate(find_last_digit(y_axis_third_quarter_score))
    ).user_name
  end

  def final_score_square_name
    return if unlocked? || x_axis_final_score.blank? || y_axis_final_score.blank?

    game.squares.find_by!(
      x: x_coordinate(find_last_digit(x_axis_final_score)),
      y: y_coordinate(find_last_digit(y_axis_final_score))
    ).user_name
  end

  def x_axis_first_quarter_score
    Score.first_quarter_score&.x_axis_score
  end

  def y_axis_first_quarter_score
    Score.first_quarter_score&.y_axis_score
  end

  def x_axis_second_quarter_score
    Score.second_quarter_score&.x_axis_score
  end

  def y_axis_second_quarter_score
    Score.second_quarter_score&.y_axis_score
  end

  def x_axis_third_quarter_score
    Score.third_quarter_score&.x_axis_score
  end

  def y_axis_third_quarter_score
    Score.third_quarter_score&.y_axis_score
  end

  def x_axis_final_score
    Score.final_score&.x_axis_score
  end

  def y_axis_final_score
    Score.final_score&.y_axis_score
  end

  private

  attr_reader :game

  def unlocked?
    !game.locked?
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
