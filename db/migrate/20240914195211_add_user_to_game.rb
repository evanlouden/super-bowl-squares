class AddUserToGame < ActiveRecord::Migration[7.1]
  def change
    change_table :games do |t|
      t.references :user, null: false, foreign_key: true, default: 1
    end
  end
end
