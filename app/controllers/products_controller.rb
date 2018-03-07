class ProductsController < ApplicationController

   def first_product_method
  product = Product.first
  render json: {
    name: product.name,
    price: product.price,
    image_url: product.image_url,
    description: product.description,
  }
 end

 def second_product_method
  product = Product.second
  render json: {
    name: product.name,
    price: product.price,
    image_url: product.image_url,
    description: product.description,
  }
 end

 def third_product_method
  product = Product.third
  render json: {
    name: product.name,
    price: product.price,
    image_url: product.image_url,
    description: product.description,
  }
 end
end

#   def all_products
#     products = Product.all
#     product_hashes = []
#     products.each do |product|
#       product_hashes << {
#         name: product.name,
#         price: product.price,
#         image_url: product.image_url,
#         description: product.description,
#       }
#     end
#     render json: product_hashes
#   end
# end


