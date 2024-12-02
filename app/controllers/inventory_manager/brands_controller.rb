module InventoryManager
  class BrandsController < ApplicationController
    def index
      brands = Brand.all
      render json: BrandSerializer.new(brands)
    end

    def show
      brand = Brand.find(params[:id])
      render json: BrandSerializer.new(brand)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Brand not found' }, status: :not_found
    end

    def create
      brand = Brand.new(brand_params)
      if brand.save
        render json: BrandSerializer.new(brand), status: :created
      else
        render json: { errors: brand.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      brand = Brand.find(params[:id])
      if brand.update(brand_params)
        render json: BrandSerializer.new(brand)
      else
        render json: { errors: brand.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Brand not found' }, status: :not_found
    end

    private

    def brand_params
      params.require(:brand).permit(:name, :manufacturer, :manufacturer_email, :manufacturer_office)
    end
  end
end
