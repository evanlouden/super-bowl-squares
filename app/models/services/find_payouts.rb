# frozen_string_literal: true

class Services::FindPayouts
  def initialize(game)
    @game = Decorators::GameDecorator.new(game)
  end

  def call
    payouts.each_with_object(Hash.new(0)) do |payout, totals|
      next if payout[:user].blank? || payout[:amount].blank?

      totals[payout[:user]] += payout[:amount]
    end
  end

  def payouts
    [
      { user: first_quarter_user, amount: first_amount },
      { user: second_quarter_user, amount: second_amount },
      { user: third_quarter_user, amount: third_amount },
      { user: fourth_quarter_user, amount: fourth_amount }
    ]
  end

  def first_quarter_user
    first_square.user || second_square.user || third_square.user || fourth_square.user
  end

  def second_quarter_user

    second_square.user || third_square.user || fourth_square.user || first_square.user
  end

  def third_quarter_user
    third_square.user || fourth_square.user || second_square.user || first_square.user
  end

  def fourth_quarter_user
    fourth_square.user || third_square.user || second_square.user || first_square.user
  end

  def total_by_user

  end


  attr_reader :game
  delegate(
    :first_square,
    :second_square,
    :third_square,
    :fourth_square,
    :first_amount,
    :second_amount,
    :third_amount,
    :fourth_amount,
    to: :game
  )
end
