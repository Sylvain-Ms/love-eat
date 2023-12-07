require "json"

def create_restaurants
  for i in [1, 2, 3, 4]
    file = File.read("db/restaurants/toulouse#{i}.json")
    data_hash = JSON.parse(file)
    for restaurant in data_hash
      Restaurant.create!(name: restaurant['name'], address: restaurant['parentGeoName'], category: restaurant['establishmentTypeAndCuisineTags'][0], menu: restaurant['menuUrl'], price: restaurant['priceTag'], image_url: restaurant['heroImgUrl'])
      p Restaurant.last.name
    end
  end
end
