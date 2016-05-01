class RemoveStringDateAddDateType < ActiveRecord::Migration
  def change
    remove_column :trips, :end_date, :string
    add_column :trips, :end_date, :date
  end
end
