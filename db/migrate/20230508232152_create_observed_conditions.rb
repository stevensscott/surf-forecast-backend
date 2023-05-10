class CreateObservedConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :observed_conditions do |t|
      t.string :date
      t.string :actual_condition    
      t.string :board_ridden
      t.string :match_forecast

      t.timestamps
    end
  end
end
