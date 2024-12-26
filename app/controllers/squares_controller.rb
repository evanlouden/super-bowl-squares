class SquaresController < ApplicationController
  before_action :set_square, only: %i[update]
  before_action :set_payment, only: %i[update]
  before_action :set_new_payment, only: %i[update]

  def update
    @square.update(user: @square.user.nil? ? current_user : nil)
    update_payment
  end

  private

  def set_square
    @square = Square.includes(:user, :game).find(params[:id])
  end

  def set_payment
    @payment = Payment.find_or_initialize_by(game: @square.game, user: current_user)
  end

  def set_new_payment
    @new_payment = @payment.new_record?
  end

  def update_payment
    @payment.update(amount: @square.game.squares_amount(current_user))
  end
end
