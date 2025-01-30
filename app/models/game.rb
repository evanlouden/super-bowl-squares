class Game < ApplicationRecord
  belongs_to :user
  has_many :headers, dependent: :destroy
  has_many :squares, dependent: :destroy
  has_many :users, through: :squares
  has_many :payments, dependent: :destroy

  validates :square_price, presence: true, numericality: { greater_than: 0 }
  validate :payout_sum_must_equal_100

  before_create :create_share_code

  def x_headers
    headers.where(axis: "x").order(:position)
  end

  def y_headers
    headers.where(axis: "y").order(:position)
  end

  def squares_amount(user)
    squares.where(user: user).size * square_price
  end

  def total_squares_amount
    @total_squares_amount ||= claimed_squares * square_price
  end

  def headers_assigned?
    headers.any? { |header| header.value.present? }
  end

  private

  def payout_sum_must_equal_100
    if first_quarter_payout + second_quarter_payout + third_quarter_payout + final_payout != 100
      errors.add(:base, "Payout sum must equal 100%")
    end
  end

  def claimed_squares
    squares.where.not(user: nil).size
  end

  def create_share_code
    self.share_code = ShareCodeGenerator.build
    while Game.exists?(share_code: share_code)
      self.share_code = ShareCodeGenerator.build
    end
  end
end
