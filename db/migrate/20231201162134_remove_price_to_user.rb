class RemovePriceToUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :price, :string
  end
end
