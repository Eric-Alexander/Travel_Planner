class RemoveTables < ActiveRecord::Migration
  def change
    drop_table :trip_users
    drop_table :trips_users
  end
end
