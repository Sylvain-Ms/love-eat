class AddPriceToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :price, :string
  end
end
