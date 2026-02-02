# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[edit update]
  before_action :set_decorated_game, only: :update

  def edit; end

  def update
    @payment.update(payment_params)
  end

  private

  def set_payment
    @payment = current_user.payments.find(params[:id])
  end

  def set_decorated_game
    @decorated_game = Decorators::GameDecorator.new(@payment.game)
  end

  def payment_params
    params.require(:payment).permit(:paid_in, :paid_out)
  end
end
