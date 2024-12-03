module InventoryManager
  class ItemsController < ApplicationController
    def index
      items = Item.all
      render json: ItemSerializer.new(items).serializable_hash
    end

    def create
      item = Item.new(item_params)
      if item.save
        render json: ItemSerializer.new(item), status: :created
      else
        render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def show
      item = item.find(params[:id])
      render json: ItemSerializer.new(item)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Items not found' }, status: :not_found
    end

    def update
      item = item.find(params[:id])
      if item.update(item_params)
        render json: ItemSerializer.new(item)
      else
        render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Items not found' }, status: :not_found
    end

    private

    def item_params
      params.require(:item).permit(:name, :brand_id, :product_id, :price, :in_stock, :minimum_required_stock, :quantity)
    end
  end
end
