module InventoryManager
  class ItemSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :price, :in_stock, :minimum_required_stock, :quantity
  end
end
