module InventoryManager
  class Category < ApplicationRecord
    self.table_name = "categories"
    validates :name, presence: true, uniqueness: true
    has_many :brand, through: :brand_categories
  end
end
