# frozen_string_literal: true

class Services::FindSquare
  def initialize(game:, x_number:, y_number:)
    @game = game
    @x_number = x_number
    @y_number = y_number
  end

  def call
    game.squares.find_by(x: x_coordinate, y: y_coordinate)
  end

  private

  attr_reader :game, :x_number, :y_number

  def x_coordinate
    game.x_headers.find_by(value: x_number).position
  end

  def y_coordinate
    game.y_headers.find_by(value: y_number).position
  end
end
