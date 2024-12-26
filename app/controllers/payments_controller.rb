# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[edit update]

  def edit; end

  def update
    @payment.update(payment_params)
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:paid_in, :paid_out)
  end
end
