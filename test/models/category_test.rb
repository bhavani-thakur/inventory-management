require "../test_helper"

module InventoryManager
  class CategoryTest < ActiveSupport::TestCase
    def setup
      @category = InventoryManager::Category.new(name: "Test Category")
    end

    test "should be valid with valid attributes" do
      assert @category.valid?
    end

    test "should be invalid without a name" do
      @category.name = nil
      assert_not @category.valid?
      assert_includes @category.errors[:name], "can't be blank"
    end

    test "should be invalid with a non-unique name" do
      duplicate_category = @category.dup
      @category.save!
      assert_not duplicate_category.valid?
      assert_includes duplicate_category.errors[:name], "has already been taken"
    end

    test "should have many products" do
      @category.save!
      brand = InventoryManager::Brand.create!(name: "Test Brand")
      product1 = InventoryManager::Product.create!(name: "Product 1", category: @category, brand: brand)
      product2 = InventoryManager::Product.create!(name: "Product 2", category: @category, brand: brand)
      assert_includes @category.products, product1
      assert_includes @category.products, product2
    end

    test "should have many brands through products" do
      @category.save!
      brand1 = InventoryManager::Brand.create!(name: "Brand 1")
      brand2 = InventoryManager::Brand.create!(name: "Brand 2")
      InventoryManager::Product.create!(name: "Product 1", category: @category, brand: brand1)
      InventoryManager::Product.create!(name: "Product 2", category: @category, brand: brand2)
      assert_includes @category.brands, brand1
      assert_includes @category.brands, brand2
    end

    test "should have many items through products" do
      @category.save!
      brand = InventoryManager::Brand.create!(name: "Test Brand")
      product = InventoryManager::Product.create!(name: "Product", category: @category, brand: brand)
      item1 = InventoryManager::Item.create!(name: "Item 1", product: product, price: rand(3))
      item2 = InventoryManager::Item.create!(name: "Item 2", product: product, price: rand(3))
      assert_includes @category.items, item1
      assert_includes @category.items, item2
    end
  end
end
