class BulkImportConditionsController < ApplicationController
  require 'csv'
# need to accept the entire file as a param and somehow run the code below
  

  def create
    pp params["file"]
    csv = File.read(params["file"])
      
    CSV.parse(csv, headers: true).each do |row|
     
      ObservedCondition.create(row.to_h)
     
    end   
     
  end
end
