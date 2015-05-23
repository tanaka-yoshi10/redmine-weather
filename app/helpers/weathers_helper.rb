module WeathersHelper
  def icontag(forecast) 
    raw '<td><img src="http://openweathermap.org/img/w/' + forecast["weather"][0]["icon"] + '.png"></td>'
  end
end
