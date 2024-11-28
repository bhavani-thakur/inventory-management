module InventoryManager
  class BrandSerializer
    include FastJsonapi::ObjectSerializer

    attributes :id, :name, :manufacturer, :manufacturer_email, :manufacturer_office

    has_many :brand_categories, dependent: :destroy
    has_many :items, through: :brand_categories
    has_many :category, through: :brand_categories
  end
end
