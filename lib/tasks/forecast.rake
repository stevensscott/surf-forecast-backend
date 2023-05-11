require 'httparty'
require 'dotenv/tasks'
namespace :forecast do
  desc "Get 5 Day Forecast once a day"
  task generate_forecast: :environment do
    DailyForecast.generate_five_day_forecast
  end

end
