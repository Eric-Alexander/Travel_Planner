class CreateTripUsers < ActiveRecord::Migration
  def change
    create_table :trip_users do |t|
      t.integer :trip_id
      t.integer :user_id
    end
  end
end
