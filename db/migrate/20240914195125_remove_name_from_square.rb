class RemoveNameFromSquare < ActiveRecord::Migration[7.1]
  def change
    remove_column :squares, :name, :string
  end
end
