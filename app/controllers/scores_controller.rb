# frozen_string_literal: true

class ScoresController < ApplicationController
  before_action :set_previous_score, only: [:new]

  def index
    @scores = Score.all.order(:created_at)
  end

  def new
    @score = Score.new(previous_score_params)
  end

  def create
    @score = Score.new(score_params)
    @score.save
  end

  private

  def score_params
    params.require(:score).permit(:x_axis_score, :y_axis_score, :quarter, :final)
  end

  def set_previous_score
    @previous_score = Score.last_by(:created_at)
  end

  def previous_score_params
    @previous_score&.attributes&.slice("x_axis_score", "y_axis_score", "quarter") || { x_axis_score: 0, y_axis_score: 0, quarter: "First" }
  end
end
