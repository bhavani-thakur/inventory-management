module InventoryManager
  class CategoriesController < ApplicationController
    def index
      categories = Category.all
      render json: CategorySerializer.new(categories)
    end

    def create
      category = Category.new(category_params)
      if category.save
        render json: CategorySerializer.new(category), status: :created
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      category = Category.find(params[:id])
      render json: CategorySerializer.new(category)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Category not found' }, status: :not_found
    end

    def update
      category = Category.find(params[:id])
      if category.update(category_params)
        render json: CategorySerializer.new(category)
      else
        render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Category not found' }, status: :not_found
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end
