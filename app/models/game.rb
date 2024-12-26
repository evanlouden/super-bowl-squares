class Game < ApplicationRecord
  belongs_to :user
  has_many :headers, dependent: :destroy
  has_many :squares, dependent: :destroy
  has_many :users, through: :squares
  has_many :payments, dependent: :destroy

  validates :square_price, presence: true, numericality: { greater_than: 0 }

  before_create :create_share_code

  def x_headers
    headers.where(axis: "x").order(:position)
  end

  def y_headers
    headers.where(axis: "y").order(:position)
  end

  def squares_amount(user)
    squares.where(user: user).count * square_price
  end

  def find_square(x:, y:)
    Services::FindSquare.new(game: self, x_number: x, y_number: y).call
  end

  private

  def create_share_code
    self.share_code = ShareCodeGenerator.build
    while Game.exists?(share_code: share_code)
      self.share_code = ShareCodeGenerator.build
    end
  end
end
