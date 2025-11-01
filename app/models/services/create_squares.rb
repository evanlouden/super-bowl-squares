# frozen_string_literal: true

class Services::CreateSquares
  def initialize(game)
    @game = game
  end

  def call
    create_headers
    create_squares
  end

  private

  attr_reader :game

  def create_headers
    ["x", "y"].each do |axis|
      10.times do |i|
        Header.create!(game: game, axis: axis, position: i)
      end
    end
  end

  def create_squares
    10.times.each do |x|
      10.times.each do |y|
        Square.create!(game: game, x: x, y: y)
      end
    end
  end
end
