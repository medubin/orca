class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country_code
      t.bigint :latitude
      t.bigint :longitude

      t.timestamps
    end
  end
end
