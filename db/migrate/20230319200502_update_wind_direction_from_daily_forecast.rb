class UpdateWindDirectionFromDailyForecast < ActiveRecord::Migration[7.0]
  def change
    change_column :daily_forecasts, :wind_direction, :string
  end
end
