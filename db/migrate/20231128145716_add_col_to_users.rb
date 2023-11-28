class AddColToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :birthdate, :datetime
    add_column :users, :diet, :string
    add_column :users, :distance, :integer
    remove_column :users, :age, :integer
    remove_column :users, :dietdistance, :integer
  end
end
