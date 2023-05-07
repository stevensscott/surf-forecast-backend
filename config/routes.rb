Rails.application.routes.draw do 
  get "/conditions", to: "conditions#index"
  post "/conditions" => "conditions#create" #creates a product and adds to db

  get "/boards", to: "boards#index"

end
