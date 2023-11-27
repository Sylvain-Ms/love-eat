class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_liked, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
