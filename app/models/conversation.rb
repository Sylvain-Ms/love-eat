class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :user_liked, class_name: "User"
  has_many :messages
end
