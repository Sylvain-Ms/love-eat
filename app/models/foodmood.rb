class Foodmood < ApplicationRecord
  belongs_to :user
  has_many :foodmood_restaurants
  has_many :restaurants, through: :foodmood_restaurants
  validates :name, presence: true
end
