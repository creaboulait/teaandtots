require 'forecast_io'  

ForecastIO.configure do |config|    
  config.api_key = Figaro.env.FORECAST_IO_KEY  
end