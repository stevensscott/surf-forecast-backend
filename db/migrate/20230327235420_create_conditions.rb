class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :time
      t.string :date
      t.float :wave_height
      t.string :wind_direction
      t.float :wind_speed

      t.timestamps
    end
  end
end
