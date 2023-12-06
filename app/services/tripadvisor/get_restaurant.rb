require 'uri'
require 'net/http'
require 'json'

class Tripadvisor::GetRestaurant
  def initialize(id, page)
    @url = URI("https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchRestaurants?locationId=#{id}&page=#{page}")
  end

  def self.call(id='187175', page='4')
    new(id, page).perform
  end

  def perform
    http = Net::HTTP.new(@url.host, @url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(@url)
    request["X-RapidAPI-Key"] = 'ba2dac5250mshe14aeee17dd453fp1033f6jsn3ad4e078cd87'
    request["X-RapidAPI-Host"] = 'tripadvisor16.p.rapidapi.com'

    response = http.request(request)
    restaurants = JSON.parse(response.body.force_encoding("UTF-8"))['data']['data']
  end
end
