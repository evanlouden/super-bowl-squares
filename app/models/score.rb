# frozen_string_literal: true

class Score < ApplicationRecord
  X_AXIS_TEAM_NAME = "Chiefs"
  Y_AXIS_TEAM_NAME = "Lions"

  QUARTERS = %w[first second third fourth].freeze

  validates :x_axis_score, :y_axis_score, presence: true
  validates :quarter, presence: true, inclusion: { in: QUARTERS }

  def self.first_quarter
    where(quarter: :first).last_by(:updated_at)
  end

  def self.second_quarter
    where(quarter: :second).last_by(:updated_at)
  end

  def self.third_quarter
    where(quarter: :third).last_by(:updated_at)
  end

  def self.final
    where(quarter: :final).last_by(:updated_at)
  end
end
