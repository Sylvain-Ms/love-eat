class AddDataToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :description, :text
    add_column :users, :price, :string
    add_column :users, :dietdistance, :integer
  end
end
