module WeathersHelper
  def icontag(forecast) 
    unless forecast.nil?
      raw '<td><img src="http://openweathermap.org/img/w/' + forecast["weather"][0]["icon"] + '.png"></td>'
    else 
      raw '<td>error</td>'
    end
  end
end
