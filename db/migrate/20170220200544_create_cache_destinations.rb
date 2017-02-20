class CreateCacheDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :cache_destinations do |t|
      t.string :name
      t.string :code
      t.bigint :place_id

      t.timestamps
    end
  end
end
