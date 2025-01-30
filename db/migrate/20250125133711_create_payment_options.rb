class CreatePaymentOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_options do |t|
      t.references :user, null: false, foreign_key: true
      t.string :payment_method, null: false
      t.string :account_id, null: true

      t.timestamps
    end
  end
end
