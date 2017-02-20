class AddCodeToAirports < ActiveRecord::Migration[5.0]
  def change
    add_column :airports, :code, :string
  end
end
