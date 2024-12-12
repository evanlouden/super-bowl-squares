class RemovedLockedFromSquares < ActiveRecord::Migration[7.1]
  def change
    remove_column :squares, :locked, :boolean
  end
end
