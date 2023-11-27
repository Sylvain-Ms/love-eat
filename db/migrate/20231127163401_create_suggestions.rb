class CreateSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :suggestions do |t|
      t.datetime :date
      t.datetime :hour
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.references :user_liked, null: false, foreign_key: {to_table: :users}


      t.timestamps
    end
  end
end
