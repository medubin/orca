class CreatePopularDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :popular_destinations do |t|
      t.bigint :starting_region_id
      t.bigint :destination_id
      t.string :destination_type
      t.integer :starting_week
      t.integer :ending_week

      t.timestamps
    end
  end
end
