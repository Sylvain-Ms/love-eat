class Suggestion < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :user_liked, class_name: "User", foreign_key: 'user_liked_id'
  validates :status, inclusion: ["accepted", "pending", "rejected"]
end
