class AddLocaleToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :locale, :string
  end
end
