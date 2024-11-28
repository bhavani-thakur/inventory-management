module InventoryManager
  class CategorySerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :description

    has_many :brand_categories
    has_many :brand, through: :brand_categories
  end
end
