module InventoryManager
  class CategoriesController < ApplicationController
    def index
      categories = Category.all
      render json: CategorySerializer.new(categories).serializable_hash
    end

    def create
      category = Category.new(category_params)
      if category.save
        render json: CategorySerializer.new(category).serializable_hash, status: :created
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end
