Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get "/first_product_method" => "products#first_product_method"
   get "/second_product_method" => "products#second_product_method"
   get "/third_product_method" => "products#third_product_method"
end
