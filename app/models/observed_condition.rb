class ObservedCondition < ApplicationRecord
  require 'csv'

  def self.run_csv_import
    csv = File.read('app/assets/conditions.csv')
    CSV.parse(csv, headers: true).each do |row|
      ObservedCondition.create(row.to_h)
      pp row["board_ridden"]
    end
  end
end
