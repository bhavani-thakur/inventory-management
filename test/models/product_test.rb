require "../test_helper"

module InventoryManager
  class ProductTest < ActiveSupport::TestCase
    def setup
      @brand = InventoryManager::Brand.create!(name: "Test Brand")       # Replace with actual attributes
      @category = InventoryManager::Category.create!(name: "Test Category") # Replace with actual attributes
      @product = InventoryManager::Product.new(name: "Sample Product", brand: @brand, category: @category)
    end

    test "should be valid with valid attributes" do
      assert @product.valid?
    end

    test "should be invalid without a name" do
      @product.name = nil
      assert_not @product.valid?
      assert_includes @product.errors[:name], "can't be blank"
    end

    test "should belong to a brand" do
      assert_equal @brand, @product.brand
    end

    test "should belong to a category" do
      assert_equal @category, @product.category
    end
  end
end
