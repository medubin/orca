class AddRoundTripToFlightCaches < ActiveRecord::Migration[5.0]
  def change
    add_column :flight_caches, :round_trip, :boolean
  end
end
