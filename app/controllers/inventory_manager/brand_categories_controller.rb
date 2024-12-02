module InventoryManager
  class BrandCategoriesController < ApplicationController
    def index
      brand_categories = BrandCategory.all
      render json: BrandCategorySerializer.new(brand_categories)
    end

    def create
      brand_category = BrandCategory.new(brand_category_params)
      if brand_category.save
        render json: BrandCategorySerializer.new(brand_category), status: :created
      else
        render json: { errors: brand_category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      brand_category = BrandCategory.find(params[:id])
      render json: BrandCategorySerializer.new(brand_category)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Brand Category not found' }, status: :not_found
    end

    def update
      brand_category = BrandCategory.find(params[:id])
      if brand_category.update(brand_category_params)
        render json: BrandCategorySerializer.new(brand_category)
      else
        render json: { errors: brand_category.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Brand Category not found' }, status: :not_found
    end

    private

    def brand_category_params
      params.require(:brand_category).permit(:name, :brand_id, :description)
    end
  end
end
