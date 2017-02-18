class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.string :name
      t.bigint :city_id
      t.bigint :latitute
      t.bigint :longitude

      t.timestamps
    end
  end
end
