class AddHourToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :hour, :string
    add_column :restaurants, :url, :string
    add_column :restaurants, :descripton, :text
  end
end
