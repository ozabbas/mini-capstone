class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    if current_user
      orders = Order.where(user_id: current_user.id)
      # orders = current_user.orders
      render json: orders.as_json
    else
      render json: [], status: :unauthorized
    end
  end
  
  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = product.tax * params[:quantity].to_i
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax:calculated_tax,
      total: calculated_total,
    )
    order.save
    render json: order.as_json
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)
    render json: order.as_json
  end
end