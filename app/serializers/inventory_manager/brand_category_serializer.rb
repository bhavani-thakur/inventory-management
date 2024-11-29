module InventoryManager
  class BrandCategorySerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :description
  end
end
