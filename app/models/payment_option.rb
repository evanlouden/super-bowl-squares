# frozen_string_literal: true

class PaymentOption < ApplicationRecord
  PAYMENT_METHODS = %w[apple_pay cash cash_app google_pay paypal other venmo zelle].freeze

  belongs_to :user

  validates :payment_method, presence: true, inclusion: { in: PAYMENT_METHODS }
  validates :account_id, presence: true, if: :valid_payment_method?

  private
  def valid_payment_method?
    payment_method != 'cash'
  end
end
