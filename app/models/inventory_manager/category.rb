module InventoryManager
  class Category < ApplicationRecord
    self.table_name = "categories"
    validates :name, presence: true, uniqueness: true
    has_many :brand_categories
    has_many :brands, through: :brand_categories
    has_many :items, through: :brand_categories
  end
end
