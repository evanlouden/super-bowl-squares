class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :destroy
  has_many :squares
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  encrypts :email, deterministic: true

  def all_games
    Game.joins(:squares).includes(:users)
      .where(squares: { user_id: id }).or(
        Game.includes(:users).where(user_id: id)).order(created_at: :desc).distinct
  end

  def admin?
    [1, 2, 7].include?(id)
  end
end
