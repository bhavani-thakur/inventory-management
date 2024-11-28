module InventoryManager
  class BrandCategoriesController < ApplicationController
    def index
      brand_categories = BrandCategory.all
      render json: BrandCategorySerializer.new(brand_categories).serializable_hash
    end

    def create
      brand_category = BrandCategory.new(brand_category_params)
      if brand_category.save
        render json: BrandCategorySerializer.new(brand_category).serializable_hash, status: :created
      else
        render json: { errors: brand_category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def brand_category_params
      params.require(:brand_category).permit(:name, :brand_id, :description)
    end
  end
end
