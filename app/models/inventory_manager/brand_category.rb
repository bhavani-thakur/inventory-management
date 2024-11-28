module InventoryManager
  class BrandCategory < ApplicationRecord
    self.table_name = "brand_categories"
    belongs_to :brand
    belongs_to :category
    validates :name, presence: true
  end
end
