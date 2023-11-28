class Like < ApplicationRecord
  belongs_to :user
  belongs_to :user_liked, class_name: "User", foreign_key: 'user_liked_id'
end
