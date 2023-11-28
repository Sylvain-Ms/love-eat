class Restaurant < ApplicationRecord
  has_many :suggestions
  has_many :users, through: :suggestions
  has_many :reviews, dependant: :destroy
  validates: name, address, phone_number, category, menu, presence: true
end
