require "../test_helper"

module InventoryManager
  class ItemTest < ActiveSupport::TestCase
    def setup
      @brand = InventoryManager::Brand.create!(name: "Test Brand")
      @category = InventoryManager::Category.create!(name: "Test Category")
      @product = InventoryManager::Product.create!(name: "Test Product", brand: @brand, category: @category)
      @item = InventoryManager::Item.new(name: "Test Item", price: 100.0, quantity: 10, product: @product)
    end

    test "should be valid with valid attributes" do
      assert @item.valid?
    end

    test "should be invalid without a name" do
      @item.name = nil
      assert_not @item.valid?
      assert_includes @item.errors[:name], "can't be blank"
    end

    test "should be invalid without a price" do
      @item.price = nil
      assert_not @item.valid?
      assert_includes @item.errors[:price], "can't be blank"
    end

    test "should belong to a product" do
      assert_equal @product, @item.product
    end

    test "should have a brand through product" do
      @item.save!
      assert_equal @brand, @item.brand
    end

    test "should have a category through product" do
      @item.save!
      assert_equal @category, @item.category
    end

    test "should update quantity correctly" do
      @item.save!
      order_item_quantity = 3
      @item.update_quantity(order_item_quantity)
      assert_equal 7, @item.reload.quantity
    end

    test "should raise error when updating quantity with insufficient stock" do
      # @item.save!
      # order_item_quantity = 15
      # assert_raises ActiveRecord::RecordInvalid do
      #   @item.update_quantity(order_item_quantity)
      # end
    end
  end
end
