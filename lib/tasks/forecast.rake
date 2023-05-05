require 'httparty'
require 'dotenv/tasks'
namespace :forecast do
  desc "Get daily surf forecast once a day"
  task generate_forecast: :environment do
    DailyForecast.create_one_day_forecast
  end

end
