class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :rating, :content, presence: true
end
