class CreateDailyForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_forecasts do |t|
      t.float :wave_height
      t.integer :wind_direction
      t.float :wind_speed

      t.timestamps
    end
  end
end
