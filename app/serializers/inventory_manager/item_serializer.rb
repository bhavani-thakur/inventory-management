module InventoryManager
  class ItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :price, :in_stock, :minimum_required_stock, :quantity

    belongs_to :brand_category
    belongs_to :category, throgh: :brand_category
    belongs_to :brand, throgh: :brand_category
  end
end
