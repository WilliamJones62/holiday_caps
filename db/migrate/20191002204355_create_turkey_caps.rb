class CreateTurkeyCaps < ActiveRecord::Migration[5.1]
  def change
    create_table :turkey_caps do |t|
      t.string :dc
      t.string :channel
      t.string :part
      t.string :units

      t.timestamps
    end
  end
end
