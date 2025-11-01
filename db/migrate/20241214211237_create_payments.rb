class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :amount, null: false
      t.boolean :paid_in, null: false, default: false
      t.boolean :paid_out, null: false, default: false
      t.timestamps
    end
  end
end
