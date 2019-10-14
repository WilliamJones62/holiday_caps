class AddHolidayBirdCapsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :holiday_bird_caps, :boolean
  end
end
