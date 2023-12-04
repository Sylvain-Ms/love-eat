class Message < ApplicationRecord
  belongs_to :conversation, dependent: :destroy
  belongs_to :sender, class_name: "User", foreign_key: 'user_id'
  validates :content, presence: true
end
