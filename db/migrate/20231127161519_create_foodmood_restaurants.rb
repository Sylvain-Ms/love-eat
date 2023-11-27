class CreateFoodmoodRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :foodmood_restaurants do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :foodmood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
