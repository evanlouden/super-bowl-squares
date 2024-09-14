class AddUserToSquare < ActiveRecord::Migration[7.1]
  def change
    change_table :squares do |t|
      t.references :user, foreign_key: true
    end
  end
end
