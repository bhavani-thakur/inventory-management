module InventoryManager
  class BrandCategory < ApplicationRecord
    self.table_name = "brand_categories"

    validates :name, presence: true
    
    belongs_to :brand
    belongs_to :category
    has_many :items
  end
end
