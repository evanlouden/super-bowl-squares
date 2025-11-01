class CreateHeaders < ActiveRecord::Migration[7.1]
  def change
    create_table :headers do |t|
      t.references :game, null: false, foreign_key: true
      t.string :axis
      t.integer :position
      t.integer :value

      t.timestamps
    end
  end
end
