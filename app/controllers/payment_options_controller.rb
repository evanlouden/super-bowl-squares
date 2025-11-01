# frozen_string_literal: true

class PaymentOptionsController < ApplicationController
  before_action :set_payment_option, only: [:edit, :update]
  def edit
  end

  def update
    if @payment_option.update(payment_option_params)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @payment_option = PaymentOption.new
  end

  def create
    @payment_option = current_user.payment_options.new(payment_option_params)

    if @payment_option.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_payment_option
    @payment_option = current_user.payment_options.find(params[:id])
  end

  def payment_option_params
    params.require(:payment_option).permit(:payment_method, :account_id)
  end
end
