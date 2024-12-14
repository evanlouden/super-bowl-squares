class Game < ApplicationRecord
  belongs_to :user
  has_many :headers, dependent: :destroy
  has_many :squares, dependent: :destroy
  has_many :users, through: :squares

  validates :square_price, presence: true, numericality: { greater_than: 0 }

  before_create :create_share_code
  after_create :create_squares

  def axis_headers(axis)
    headers.where(axis: axis)
  end

  private

  def create_share_code
    self.share_code = ShareCodeGenerator.build
    while Game.exists?(share_code: share_code)
      self.share_code = ShareCodeGenerator.build
    end
  end

  def create_squares
    ["x", "y"].each do |axis|
      10.times do |i|
        Header.create!(game: self, axis: axis, position: i)
      end
    end

    10.times.each do |x|
      10.times.each do |y|
        Square.create!(game: self, x: x, y: y)
      end
    end
  end
end
