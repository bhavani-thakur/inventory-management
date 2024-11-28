module InventoryManager
  class Item < ApplicationRecord
    self.table_name = "items"

    belongs_to :brand_category
    has_one :brand, through: :brand_category
    has_one :category, through: :brand_category

    validates :name, :price, :in_stock, presence: true
  end
end
