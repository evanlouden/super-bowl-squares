# frozen_string_literal: true

require "rails_helper"

RSpec.describe Score do
  it "is valid with valid attributes" do
    score = Score.new(quarter: 1, x_axis_score: 10, y_axis_score: 10)

    expect(score).to be_valid
  end

  describe ".quarter_scores" do
    context "when there are multiple scores for all quarters" do
      it "returns the scores" do
        Score.create!(quarter: 1, x_axis_score: 10, y_axis_score: 10, updated_at: 2.minutes.ago)
        Score.create!(quarter: 1, x_axis_score: 11, y_axis_score: 11, updated_at: 1.minute.ago)
        Score.create!(quarter: 2, x_axis_score: 20, y_axis_score: 20, updated_at: 2.minutes.ago)
        Score.create!(quarter: 2, x_axis_score: 21, y_axis_score: 21, updated_at: 1.minute.ago)
        Score.create!(quarter: 3, x_axis_score: 30, y_axis_score: 30, updated_at: 2.minutes.ago)
        Score.create!(quarter: 3, x_axis_score: 31, y_axis_score: 31, updated_at: 1.minute.ago)
        Score.create!(quarter: 4, x_axis_score: 40, y_axis_score: 40, updated_at: 2.minutes.ago)
        Score.create!(quarter: 4, x_axis_score: 41, y_axis_score: 41, updated_at: 1.minute.ago)

        results = described_class.quarter_scores

        first_quarter = results.find { |result| result.quarter == 1 }
        second_quarter = results.find { |result| result.quarter == 2 }
        third_quarter = results.find { |result| result.quarter == 3 }
        fourth_quarter = results.find { |result| result.quarter == 4 }

        expect(first_quarter.x_axis_score).to eq(11)
        expect(second_quarter.x_axis_score).to eq(21)
        expect(third_quarter.x_axis_score).to eq(31)
        expect(fourth_quarter.x_axis_score).to eq(41)
      end
    end

    context "when aren't squares for all quarters" do
      it "returns the scores" do
        Score.create!(quarter: 1, x_axis_score: 10, y_axis_score: 10, updated_at: 2.minutes.ago)
        Score.create!(quarter: 1, x_axis_score: 11, y_axis_score: 11, updated_at: 1.minute.ago)
        Score.create!(quarter: 2, x_axis_score: 20, y_axis_score: 20, updated_at: 2.minutes.ago)
        Score.create!(quarter: 2, x_axis_score: 21, y_axis_score: 21, updated_at: 1.minute.ago)
        Score.create!(quarter: 3, x_axis_score: 30, y_axis_score: 30, updated_at: 2.minutes.ago)
        Score.create!(quarter: 3, x_axis_score: 31, y_axis_score: 31, updated_at: 1.minute.ago)

        results = described_class.quarter_scores

        first_quarter = results.find { |result| result.quarter == 1 }
        second_quarter = results.find { |result| result.quarter == 2 }
        third_quarter = results.find { |result| result.quarter == 3 }
        fourth_quarter = results.find { |result| result.quarter == 4 }

        expect(first_quarter.x_axis_score).to eq(11)
        expect(second_quarter.x_axis_score).to eq(21)
        expect(third_quarter.x_axis_score).to eq(31)
        expect(fourth_quarter).to be_nil
      end
    end
  end
end
