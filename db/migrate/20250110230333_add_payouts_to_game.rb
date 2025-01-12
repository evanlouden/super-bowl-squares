class AddPayoutsToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :first_quarter_payout, :integer, null: false
    add_column :games, :second_quarter_payout, :integer, null: false
    add_column :games, :third_quarter_payout, :integer, null: false
    add_column :games, :final_payout, :integer, null: false
  end
end
