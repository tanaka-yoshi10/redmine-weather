class Weather < ActiveRecord::Base
  unloadable
  attr_accessible :city, :country

  def weather
    begin
      uri = URI.parse('http://api.openweathermap.org/data/2.5/weather?q=%22' + self.city + ',' + self.country + '%22')
      # json = Net::HTTP.get(uri)
      # ex)
      json = '{"coord":{"lon":135.22,"lat":34.7},"sys":{"message":0.0103,"country":"Japan","sunrise":1429992852,"sunset":1430041179},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],"base":"stations","main":{"temp":281.198,"temp_min":281.198,"temp_max":281.198,"pressure":1018.27,"sea_level":1034.35,"grnd_level":1018.27,"humidity":84},"wind":{"speed":1.17,"deg":159.5},"clouds":{"all":0},"dt":1430082145,"id":0,"name":"Kobe-Shi","cod":200}'

      JSON.parse(json)["weather"][0]
    rescue Exception => e
      logger.warn e
      logger.warn json

      {"main"=>"error", "icon"=>"01n"}
    end
  end

  def forecast(count)
    begin
      uri = URI.parse('http://api.openweathermap.org/data/2.5/forecast/daily?q=' + self.city + '&cnt=' + count.to_s)

      json = Net::HTTP.get(uri)
      # ex)
      #json = '{"cod":"200","message":0.0889,"city":{"id":6058560,"name":"London","coord":{"lon":-81.23304,"lat":42.983391},"country":"CA","population":0,"sys":{"population":0}},"cnt":7,"list":[{"dt":1432314000,"temp":{"day":11.47,"min":0.75,"max":11.47,"night":0.75,"eve":7.83,"morn":8.27},"pressure":1004.17,"humidity":0,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":8.61,"deg":327,"clouds":0,"rain":0.24},{"dt":1432400400,"temp":{"day":14.1,"min":4.53,"max":14.8,"night":9.93,"eve":14.8,"morn":4.53},"pressure":1011.02,"humidity":0,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":5.03,"deg":258,"clouds":0},{"dt":1432486800,"temp":{"day":20.2,"min":12.04,"max":20.2,"night":13,"eve":16.97,"morn":12.04},"pressure":1006.01,"humidity":0,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"speed":4.08,"deg":249,"clouds":61,"rain":3.54},{"dt":1432573200,"temp":{"day":14.82,"min":10.72,"max":16.34,"night":15.55,"eve":16.34,"morn":10.72},"pressure":996.06,"humidity":0,"weather":[{"id":503,"main":"Rain","description":"very heavy rain","icon":"10d"}],"speed":2.66,"deg":153,"clouds":97,"rain":55.26},{"dt":1432659600,"temp":{"day":15.85,"min":13.02,"max":15.85,"night":13.02,"eve":15.13,"morn":15.6},"pressure":990.44,"humidity":0,"weather":[{"id":502,"main":"Rain","description":"heavy intensity rain","icon":"10d"}],"speed":4.05,"deg":62,"clouds":92,"rain":18.24},{"dt":1432746000,"temp":{"day":13.74,"min":10.79,"max":13.74,"night":10.79,"eve":13.68,"morn":10.79},"pressure":998.3,"humidity":0,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"speed":7.22,"deg":72,"clouds":85,"rain":7.89},{"dt":1432832400,"temp":{"day":16.1,"min":9.83,"max":16.51,"night":9.83,"eve":16.51,"morn":10.06},"pressure":1000.35,"humidity":0,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"speed":4.04,"deg":302,"clouds":18,"rain":6.84}]}'

      JSON.parse(json)["list"]
    #rescue Exception => e
      #logger.warn e
      #logger.warn json
#
      #{"main"=>"error", "icon"=>"01n"}
    end
  end
end
