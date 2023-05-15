

# This defines the schedule and what rake test to run from the forecast.rake file
set :output, "log/cron.log"
every 1.hour do
  rake "forecast:generate_forecast"
end