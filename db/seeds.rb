# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |gender_name|
#     Moviegender.find_or_create_by!(name: gender_name)
#   end

require_relative 'users/seed.rb'
require_relative 'restaurants/seed.rb'

create_restaurants
create_users
