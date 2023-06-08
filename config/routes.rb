Rails.application.routes.draw do 
  get "/conditions", to: "conditions#index"
  post "/conditions" => "conditions#create" #creates a product and adds to db

  get "/boards", to: "boards#index"

  get "/observed_conditions", to: "observed_conditions#index"
  post "/observed_conditions" => "observed_conditions#create"

  post "/bulk_import_conditions" => "bulk_import_conditions#create" 
end
