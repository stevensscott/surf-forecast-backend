require 'httparty'
require 'dotenv/tasks'
# the task name here is generate_forecast. This task runs the generate_five_day_forecast method which is in my daily_forecast model.
namespace :forecast do
  desc "Get 5 Day Forecast once a day"
  task generate_forecast: :environment do
    DailyForecast.generate_five_day_forecast
  end

end
