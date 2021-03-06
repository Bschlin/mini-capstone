class V1::OrdersController < ApplicationController

  before_action :authenticate_user

  def index 
    if current_user
      orders = current_user.orders.order(:id)
      render json: orders.as_json
    else 
      render json: []
    end 
  end  

  def create 
    carted_products = current_user.carted_products.where(status: "carted")
    
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end 
    
    tax = subtotal * 0.09
    total = subtotal + tax

    # product = Product.find_by(id: params[:product_id])
    # subtotal = product.price * params[:quantity].to_i
    order = Order.new(      
      # product_id: params[:product_id],
      # quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: 422
    end 
  end 
end
