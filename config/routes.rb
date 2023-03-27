Rails.application.routes.draw do
 # get "/suppliers" => "suppliers#index" #displays all products
 # get "/suppliers/:id" => "suppliers#show" #displays single product by passing in product id variable from url
  post "/conditions" => "conditions#create" #creates a product and adds to db
 # patch "/suppliers/:id" =>"suppliers#update"#updates a product by ID
 # delete "/suppliers/:id" =>"suppliers#destroy"#deletes a product by ID
end
