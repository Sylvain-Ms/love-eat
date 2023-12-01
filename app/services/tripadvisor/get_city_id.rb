require 'uri'
require 'net/http'
require 'json'

class Tripadvisor::GetCityId
  def initialize(city)
    @url = URI("https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchLocation?query=#{city}")
  end

  def self.call(city)
    new(city).perform
  end

  def perform
    http = Net::HTTP.new(@url.host, @url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(@url)
    request["X-RapidAPI-Key"] = 'ba2dac5250mshe14aeee17dd453fp1033f6jsn3ad4e078cd87'
    request["X-RapidAPI-Host"] = 'tripadvisor16.p.rapidapi.com'

    response = http.request(request)
    data = JSON.parse(response.read_body)
    puts data['data'][0]['locationId']
  end
end
