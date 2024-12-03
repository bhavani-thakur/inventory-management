module InventoryManager
  class ItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :price, :minimum_required_stock, :quantity
  end
end
