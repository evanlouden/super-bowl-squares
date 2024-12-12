class AddLockedToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :locked, :boolean, default: false
  end
end
