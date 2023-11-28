class Review < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy
  belongs_to :user
  validates :rating, :content, presence: true
end
