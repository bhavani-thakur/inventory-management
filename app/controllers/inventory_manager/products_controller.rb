module InventoryManager
  class ProductsController < ApplicationController
    def index
      products = Product.all
      render json: ProductSerializer.new(products)
    end

    def create
      product = Product.new(products_params)
      if product.save
        render json: ProductSerializer.new(product), status: :created
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      product = Product.find(params[:id])
      render json: ProductSerializer.new(product)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Product Not Found' }, status: :not_found
    end

    def update
      product = Product.find(params[:id])
      if product.update(products_params)
        render json: ProductSerializer.new(product)
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Product Not Found' }, status: :not_found
    end

    private

    def products_params
      params.require(:product).permit(:name, :brand_id, :description)
    end
  end
end
