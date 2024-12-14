class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :destroy
  has_many :squares
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  encrypts :email, deterministic: true

  def squares_games
    Game.joins(:squares).where(squares: { user_id: id }).order(created_at: :desc).distinct
  end
end
