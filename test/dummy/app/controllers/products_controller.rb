module InventoryManager
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update]

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
      render json: ProductSerializer.new(@product)
    end

    def update
      if @product.update(products_params)
        render json: ProductSerializer.new(@product)
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def products_params
      params.require(:product).permit(:name, :brand_id, :description, :category_id)
    end
  end
end
