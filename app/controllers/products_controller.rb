class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  before_action :authenticate_user, only: [:index]

  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    # happy path/sad path
    
    product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )
    if product.save
      # make a new image
      image = Image.new(url: params[:image_url], product_id: product.id)
      image.save
      render json: product
    else
      # sad path
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def update
    # find the product
    product = Product.find_by(id: params[:id])
    # update the product
    product.update(
      name: params[:name] || product.name,
      description: params[:description] || product.description,
      price: params[:price] || product.price,
      image_url: params[:image_url] || product.image_url
    )
    render json: product
  end

  def destroy
    # find the correct product
    product = Product.find_by(id: params[:id])
    # delete it
    product.destroy
    render json: {message: "product has been removed"}
  end
end