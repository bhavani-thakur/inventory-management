module InventoryManager
  class Item < ApplicationRecord
    self.table_name = "items"

    belongs_to :product
    has_one :brand, through: :product
    has_one :category, through: :product
    has_many :order_items, class_name: 'OrderManagement::OrderItems'

    validates :name, :price, presence: true

    def update_quantity(order_item_quantity)
      self.update!(quantity: quantity - order_item_quantity)
    end
  end
end
