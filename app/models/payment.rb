class Payment < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :amount, presence: true
end
