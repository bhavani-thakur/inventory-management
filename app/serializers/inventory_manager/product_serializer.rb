module InventoryManager
  class ProductSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :description
  end
end
