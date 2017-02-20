class AddCountryToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :country, :string
  end
end
