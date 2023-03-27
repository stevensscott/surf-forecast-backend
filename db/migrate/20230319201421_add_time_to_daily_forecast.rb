class AddTimeToDailyForecast < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_forecasts, :time, :string
  end
end
