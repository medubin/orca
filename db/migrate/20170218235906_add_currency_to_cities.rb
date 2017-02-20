class AddCurrencyToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :currency, :string
  end
end
