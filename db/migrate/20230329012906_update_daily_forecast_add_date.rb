class UpdateDailyForecastAddDate < ActiveRecord::Migration[7.0]
  def change
    add_column :daily_forecasts, :date, :string
  end
end
