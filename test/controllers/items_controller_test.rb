require "../test_helper"

module InventoryManager
  class ItemsControllerTest < ActionDispatch::IntegrationTest
    setup do
      # Create a valid Category and Brand
      @category = Category.create!(name: "Electronics", description: "Electronic gadgets")
      @brand = Brand.create!(name: "Test Brand")
      
      # Create a Product associated with the Brand and Category
      @product = Product.create!(name: "Test Product", brand: @brand, category: @category)
      
      # Create an Item associated with the Product, Brand, and Category
      @item = Item.create!(name: "Test Item", product: @product, price: 100, minimum_required_stock: 10, quantity: 50)
      
      # Define valid and invalid update parameters
      @valid_item_params = { name: "Updated Item", product_id: @product.id, price: 150, minimum_required_stock: 5, quantity: 30 }
      @invalid_item_params = { name: "", price: nil, minimum_required_stock: nil, quantity: nil }
    end

    test "should get index" do
      get inventory_manager.items_url
      assert_response :success
      assert_not_empty response.body
    end

    test "should create item with valid attributes" do
      assert_difference('Item.count', 1) do
        post inventory_manager.items_url, params: { item: @valid_item_params }
      end
      assert_response :created
      item = Item.last
      assert_equal @valid_item_params[:name], item.name
      assert_equal @valid_item_params[:price], item.price
      assert_equal @valid_item_params[:quantity], item.quantity
    end

    test "should not create item with invalid attributes" do
      assert_no_difference('Item.count') do
        post inventory_manager.items_url, params: { item: @invalid_item_params }
      end
      assert_response :unprocessable_entity
      assert_includes response.body, "Name can't be blank"
      assert_includes response.body, "Product must exist"
      assert_includes response.body, "Price can't be blank"      
    end

    test "should show item" do
      get inventory_manager.item_url(@item)
      assert_response :success
      item_data = JSON.parse(response.body)
      assert_equal @item.name, item_data['data']['attributes']['name']
      assert_equal @item.price, item_data['data']['attributes']['price']
    end

    test "should update item with valid attributes" do
      patch inventory_manager.item_url(@item), params: { item: @valid_item_params }
      assert_response :success
      @item.reload
      assert_equal @valid_item_params[:name], @item.name
      assert_equal @valid_item_params[:price], @item.price
      assert_equal @valid_item_params[:quantity], @item.quantity
    end

    test "should not update item with invalid attributes" do
      patch inventory_manager.item_url(@item), params: { item: @invalid_item_params }
      assert_response :unprocessable_entity
      @item.reload
      assert_not_equal @invalid_item_params[:name], @item.name
      assert_not_equal @invalid_item_params[:price], @item.price
    end
  end
end
