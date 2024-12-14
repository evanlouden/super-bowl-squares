class AddSquarePriceToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :square_price, :integer, null: false
  end
end
