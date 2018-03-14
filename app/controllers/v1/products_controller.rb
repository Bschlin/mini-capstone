class V1::ProductsController < ApplicationController

  # def first_product_method
  #   product = Product.first
  #   render json: {
  #     name: product.name,
  #     price: product.price,
  #     image_url: product.image_url,
  #     description: product.description,
  #   }
  # end

  # def second_product_method
  #   product = Product.second
  #   render json: {
  #     name: product.name,
  #     price: product.price,
  #     image_url: product.image_url,
  #     description: product.description,
  #   }
  # end

  # def third_product_method
  #   product = Product.third
  #   render json: {
  #     name: product.name,
  #     price: product.price,
  #     image_url: product.image_url,
  #     description: product.description,
  #   }
  # end

 # def all_products
 #    products = Product.all
 #    product_hashes = []
 #    products.each do |product|
 #      product_hashes << {
 #        name: product.name,
 #        price: product.price,
 #        image_url: product.image_url,
 #        description: product.description,
 #      }
 #    end
 #    render json: product_hashes
 #  end

  def index
    products = Product.all
    render json: products.as_json
  end 

  def show
    product_id = params["id"]
    products = Product.find_by(id: product_id)
    render json: products.as_json
  end

  def create
    product = Product.new(      
      name: params["input_name"],
      price: params["input_price"],
      image_url: params["input_image_url"],
      description: params["input_description"]
      )
    if product.save
      render json: product.as_json
    else 
      render json: {errors: product.errors.full_messages}, status: 422
    end 
  end

  def update
    product_id = params["id"]
    products = Product.find_by(id: product_id)
    products.name = params["input_name"] || products.name
    products.price = params["input_price"] || products.price
    products.image_url = params["input_image_url"] || products.image_url
    products.description = params["input_description"] || products.description
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: 422
    end
  end

  def destroy
    product_id = params["id"]
    products = Product.find_by(id: product_id)
    products.destroy
    render json: {message: "Product successfully destroyed!"}
  end 


end


