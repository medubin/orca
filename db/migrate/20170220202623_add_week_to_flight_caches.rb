class AddWeekToFlightCaches < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_caches, :week, :integer
  end
end
