# frozen_string_literal: true

class Score < ApplicationRecord
  Y_AXIS_TEAM_NAME = "Patriots"
  X_AXIS_TEAM_NAME = "Seahawks"


  validates :x_axis_score, :y_axis_score, presence: true
  validates :quarter, presence: true, inclusion: { in: [1, 2, 3, 4] }

  def display_quarter
    { 1 => "First", 2 => "Second", 3 => "Third", 4 => "Fourth" }[quarter]
  end

  def self.quarter_scores
    select("DISTINCT ON (quarter) quarter, x_axis_score, y_axis_score, updated_at")
    .order("quarter, updated_at DESC")
  end
end
