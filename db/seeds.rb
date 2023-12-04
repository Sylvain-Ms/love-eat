# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
kfc=Restaurant.create(name:"kfc", address:"bordeaux", phone_number:"3516461656",category:"fastfood", menu:"poulet pas bon")
petit_pierre=Restaurant.create(name:"Petit Pierre", address:"beziers", phone_number:"656565651",category:"gastro", menu:"tres bon")

maxou=User.create(first_name:"maxou", last_name:"bg", email:"max@gmail.com", diet:"carni", birthdate:"25/10/1990", password:"123456", price:"$$", distance:10)
jassy=User.create(first_name:"Jassy", last_name:"po", email:"jassy@gmail.com",diet:"vege", birthdate:"10/02/1989", password:"123456", price:"$$$", distance:20)

japan=Foodmood.create(name:"japanese", user: maxou)
libanais=Foodmood.create(name:"libanais", user: jassy)
