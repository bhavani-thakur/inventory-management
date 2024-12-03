module InventoryManager
  class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :update]

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
      render json: ItemSerializer.new(@item)
    end

    def update
      if @item.update(item_params)
        render json: ItemSerializer.new(@item)
      else
        render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :brand_id, :product_id, :price, :minimum_required_stock, :quantity)
    end
  end
end
