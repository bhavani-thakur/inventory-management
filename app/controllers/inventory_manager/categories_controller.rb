module InventoryManager
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update]

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
      render json: CategorySerializer.new(@category)
    end

    def update
      if @category.update(category_params)
        render json: CategorySerializer.new(@category)
      else
        render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end
