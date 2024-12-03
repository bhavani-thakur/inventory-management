module InventoryManager
  class Category < ApplicationRecord
    self.table_name = "categories"
    validates :name, presence: true, uniqueness: true
    has_many :products
    has_many :brands, through: :products
    has_many :items, through: :products
  end
end
