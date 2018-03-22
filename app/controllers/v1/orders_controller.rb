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
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(      
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if order.save
      render json: order.as_json
    else 
      render json: {errors: order.errors.full_messages}, status: 422
    end 
  end 
end
