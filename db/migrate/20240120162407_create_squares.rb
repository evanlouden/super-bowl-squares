class CreateSquares < ActiveRecord::Migration[7.1]
  def change
    create_table :squares do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
