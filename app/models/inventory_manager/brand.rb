module InventoryManager
  class Brand < ApplicationRecord
    self.table_name = "brands"
    has_many :products, dependent: :destroy
    has_many :items, through: :products
    has_many :category, through: :products

    validates :name, presence: true, uniqueness: true
  end
end
