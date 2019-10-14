class RemoveUnitsFromTurkeyCaps < ActiveRecord::Migration[5.1]
  def change
    remove_column :turkey_caps, :units, :string
  end
end
