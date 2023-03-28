class CreateUpdateWindSpeedDataTypeDailyConditions < ActiveRecord::Migration[7.0]
  def change
  
    change_column :daily_forecasts, :wind_direction_12PM, :string
    change_column :daily_forecasts, :wind_direction_5PM, :string
  end
end
