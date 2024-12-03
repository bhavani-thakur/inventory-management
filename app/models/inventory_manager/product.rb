module InventoryManager
  class Product < ApplicationRecord
    self.table_name = "products"

    validates :name, presence: true
    
    belongs_to :brand
    belongs_to :category
    has_many :items
  end
end
