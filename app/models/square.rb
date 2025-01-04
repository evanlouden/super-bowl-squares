class Square < ApplicationRecord
  belongs_to :game
  belongs_to :user, optional: true

  delegate :name, to: :user, prefix: true, allow_nil: true
end
