require "../test_helper"

module InventoryManager
  class BrandTest < ActiveSupport::TestCase
    def setup
      @brand = InventoryManager::Brand.new(name: "Test Brand")
    end

    test "should be valid with valid attributes" do
      assert @brand.valid?
    end

    test "should be invalid without a name" do
      @brand.name = nil
      assert_not @brand.valid?
      assert_includes @brand.errors[:name], "can't be blank"
    end

    test "should be invalid with a non-unique name" do
      duplicate_brand = @brand.dup
      @brand.save!
      assert_not duplicate_brand.valid?
      assert_includes duplicate_brand.errors[:name], "has already been taken"
    end

    test "should have many products" do
      @brand.save!
      category = InventoryManager::Category.create!(name: "Test Category") # Create a category

      product1 = InventoryManager::Product.create!(name: "Product 1", brand: @brand, category: category)
      product2 = InventoryManager::Product.create!(name: "Product 2", brand: @brand, category: category)
      assert_includes @brand.products, product1
      assert_includes @brand.products, product2
    end

    test "should have many items through products" do
      @brand.save!
      category = InventoryManager::Category.create!(name: "Test Category") # Create a category
      product = InventoryManager::Product.create!(name: "Product", brand: @brand, category: category) # Associate the product with the category
      item1 = InventoryManager::Item.create!(name: "Item 1", product: product, price: rand(3))
      item2 = InventoryManager::Item.create!(name: "Item 2", product: product, price: rand(3))
      
      assert_includes @brand.items, item1
      assert_includes @brand.items, item2
    end

    test "should have many categories through products" do
      @brand.save!
      category1 = InventoryManager::Category.create!(name: "Category 1")
      category2 = InventoryManager::Category.create!(name: "Category 2")
      InventoryManager::Product.create!(name: "Product 1", brand: @brand, category: category1)
      InventoryManager::Product.create!(name: "Product 2", brand: @brand, category: category2)
      assert_includes @brand.category, category1
      assert_includes @brand.category, category2
    end

    test "should destroy associated products on delete" do
      @brand.save!
      category = InventoryManager::Category.create!(name: "Test Category") # Create a category
      product = InventoryManager::Product.create!(name: "Product", brand: @brand, category: category) # Associate the product with the category

      assert_difference("InventoryManager::Product.count", -1) do
        @brand.destroy
      end
    end
  end
end
