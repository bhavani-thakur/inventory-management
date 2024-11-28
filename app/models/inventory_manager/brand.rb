module InventoryManager
  class Brand < ApplicationRecord
    self.table_name = "brands"
    has_many :brand_categories, dependent: :destroy
    has_many :items, through: :brand_categories
    has_many :category, through: :brand_categories

    validates :name, presence: true, uniqueness: true
  end
end
