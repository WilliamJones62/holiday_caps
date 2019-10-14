class AddCapToTurkeyCaps < ActiveRecord::Migration[5.1]
  def change
    add_column :turkey_caps, :cap, :integer
  end
end
