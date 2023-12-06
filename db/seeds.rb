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

create_users
create_restaurants

kfc=Restaurant.create(name:"kfc", address:"bordeaux", phone_number:"3516461656",category:"fastfood", menu:"poulet pas bon")
petit_pierre=Restaurant.create(name:"Petit Pierre", address:"beziers", phone_number:"656565651",category:"gastro", menu:"tres bon")

maxou=User.create(first_name:"maxou", last_name:"bg", email:"max@gmail.com", diet:"carni", birthdate:"25/10/1990", password:"123456", gender:"homme", distance:10)
jassy=User.create(first_name:"Jassy", last_name:"po", email:"jassy@gmail.com",diet:"vege", birthdate:"10/02/1989", password:"123456", gender:"femme", distance:20)

japan=Foodmood.create(name:"japanese", user: maxou)
libanais=Foodmood.create(name:"libanais", user: jassy)
