module InventoryManager
  class ItemsController < ApplicationController
    def index
      items = Item.all
      render json: ItemSerializer.new(items).serializable_hash
    end

    private

    def item_params
      params.require(:item).permit(:name, :brand_id, :brand_category_id, :price, :in_stock, :minimum_required_stock, :quantity)
    end
  end
end
