class User < ApplicationRecord
  has_many :squares
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  encrypts :email
end
