module InventoryManager
  class BrandsController < ApplicationController
    before_action :set_brand, only: [:show, :update]

    def index
      brands = Brand.all
      render json: BrandSerializer.new(brands)
    end

    def show
      render json: BrandSerializer.new(@brand)
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
      if @brand.update(brand_params)
        render json: BrandSerializer.new(@brand)
      else
        render json: { errors: @brand.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    def set_brand
      @brand = Brand.find(params[:id])
    end


    def brand_params
      params.require(:brand).permit(:name, :manufacturer, :manufacturer_email, :manufacturer_office)
    end
  end
end
