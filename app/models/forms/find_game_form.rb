# frozen_string_literal: true

class Forms::FindGameForm
  include ActiveModel::Model

  attr_accessor :share_code

  validate :valid_share_code

  def game
    @game ||= Game.find_by(share_code: normalized_share_code)
  end

  def valid_share_code
    errors.add(:share_code, "is invalid") unless game.present?
  end

  private

  def normalized_share_code
    share_code.upcase.squish
  end
end
