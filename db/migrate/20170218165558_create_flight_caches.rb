class CreateFlightCaches < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_caches do |t|
      t.bigint :origin_id
      t.string :origin_id_type
      t.bigint :destination_id
      t.string :destination_type
      t.bigint :price_min
      t.bigint :airline_id
      t.integer :api_id

      t.timestamps
    end
  end
end
