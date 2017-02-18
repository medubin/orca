class CreateAirlines < ActiveRecord::Migration[5.0]
  def change
    create_table :airlines do |t|
      t.string :airline_name

      t.timestamps
    end
  end
end
