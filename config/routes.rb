Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    # get "/first_product_method" => "products#first_product_method"
    # get "/second_product_method" => "products#second_product_method"
    # get "/third_product_method" => "products#third_product_method"
    # get "/all_products" => "products#all_products"
    get "/products" => "products#index"
    get "/product/:id" => "products#show"
    post "/product" => "products#create"
    patch "/products/:id" => "products#update"
    delete "products/:id" => "products#destroy"
  end
end
