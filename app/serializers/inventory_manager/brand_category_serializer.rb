module InventoryManager
  class BrandCategorySerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :description

    belongs_to :brand
    belongs_to :category
    
  end
end
