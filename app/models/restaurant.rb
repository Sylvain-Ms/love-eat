class Restaurant < ApplicationRecord
  has_many :suggestions
  has_many :users, through: :suggestions
  has_many :reviews, dependent: :destroy
  validates :name, :address, :phone_number, :category, :menu, presence: true

  scope :common, -> (user, user_liked) do
    where(category: user.foodmoods.map(&:name)).where(category: user_liked.foodmoods.map(&:name))
  end

  def self.save_csv(restaurants)
    CSV.open("#{root_path}/db/restaurants.csv", "a") do |csv|
      csv << %w[id name address phone_number category menu price]
      restaurants.each do |restaurant|
        csv << [restaurant.name, restaurant.address, restaurant.phone_number, restaurant.category, restaurant.menu, restaurant.price]
      end
    end
  end
end
