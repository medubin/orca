class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.integer :city_id

      t.timestamps
    end
  end
end
