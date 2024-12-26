# frozen_string_literal: true

class Services::AssignNumbers
  NUMBERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize(game)
    @game = game
  end

  def call
    assign_x_headers
    assign_y_headers
  end

  def assign_x_headers
    shuffled_numbers = NUMBERS.shuffle
    @game.x_headers.each do |header|
      header.update!(value: shuffled_numbers.shift)
    end
  end

  def assign_y_headers
    shuffled_numbers = NUMBERS.shuffle
    @game.y_headers.each do |header|
      header.update!(value: shuffled_numbers.shift)
    end
  end
end
