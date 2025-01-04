class AddScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.integer :x_axis_score, null: false
      t.integer :y_axis_score, null: false
      t.string :quarter, null: false
      t.boolean :final, default: false

      t.timestamps
    end
  end
end
