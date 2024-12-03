module InventoryManager
  class Item < ApplicationRecord
    self.table_name = "items"

    belongs_to :product
    has_one :brand, through: :product
    has_one :category, through: :product

    validates :name, :price, :in_stock, presence: true
  end
end
