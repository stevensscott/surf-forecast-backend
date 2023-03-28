class UpdateDailyForecast < ActiveRecord::Migration[7.0]
  def change
    #rename_column :table, :old_column, :new_column
    rename_column :daily_forecasts, :wave_height, :wave_height_7AM
    rename_column :daily_forecasts, :wind_direction, :wind_direction_7AM
    rename_column :daily_forecasts, :wind_speed, :wind_speed_7AM

    add_column :daily_forecasts, :wave_height_12PM, :float
    add_column :daily_forecasts, :wind_direction_12PM, :float
    add_column :daily_forecasts, :wind_speed_12PM, :float

    add_column :daily_forecasts, :wave_height_5PM, :float
    add_column :daily_forecasts, :wind_direction_5PM, :float
    add_column :daily_forecasts, :wind_speed_5PM, :float





    #remove_column :sample_apps, :country, :string
    remove_column :daily_forecasts, :time, :string
  end
end
