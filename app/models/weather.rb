class Weather < ActiveRecord::Base
  unloadable
  attr_accessible :city, :country

  def weather
    begin
      uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=%22' + self.city + '","' + self.country + '%22')
      json = Net::HTTP.get(uri)
      # ex)
      # json = '{"coord":{"lon":135.22,"lat":34.7},"sys":{"message":0.0103,"country":"Japan","sunrise":1429992852,"sunset":1430041179},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],"base":"stations","main":{"temp":281.198,"temp_min":281.198,"temp_max":281.198,"pressure":1018.27,"sea_level":1034.35,"grnd_level":1018.27,"humidity":84},"wind":{"speed":1.17,"deg":159.5},"clouds":{"all":0},"dt":1430082145,"id":0,"name":"Kobe-Shi","cod":200}'

      JSON.parse(json)["weather"][0]
    rescue Exception => e
      logger.warn e
      logger.warn json

      {"main"=>"error", "icon"=>"01n"}
    end
  end
end
