class Game < ApplicationRecord
  belongs_to :user
  has_many :headers, dependent: :destroy
  has_many :squares, dependent: :destroy
  has_many :users, through: :squares
  has_many :payments, dependent: :destroy

  validates :square_price, presence: true

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

  def first_quarter_payout
    0.20
  end

  def second_quarter_payout
    0.20
  end

  def third_quarter_payout
    0.20
  end

  def final_payout
    0.20
  end

  def total_squares_amount
    claimed_squares * square_price
  end

  private

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
