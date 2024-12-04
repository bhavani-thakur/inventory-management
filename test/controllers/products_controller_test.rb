require "../test_helper"

module InventoryManager
  class ProductsControllerTest < ActionDispatch::IntegrationTest
    setup do
      # Create valid categories and brands
      @category = Category.create!(name: "Electronics", description: "Electronics products")
      @brand = Brand.create!(name: "Test Brand", manufacturer: "Test Manufacturer", manufacturer_email: "test@manufacturer.com", manufacturer_office: "Test Office")
      
      # Create a valid product for the tests
      @product = Product.create!(name: "Test Product", brand: @brand, category: @category, description: "Test Product Description")
      
      # Define valid and invalid product parameters for testing
      @valid_product_params = { name: "Updated Product", brand_id: @brand.id, description: "Updated Product Description", category_id: @category.id }
      @invalid_product_params = { name: "", brand_id: nil, description: "", category_id: nil }
    end

    test "should get index" do
      get inventory_manager.products_url
      assert_response :success
      assert_includes response.body, @product.name # Ensure the product name is present in the response
    end

    test "should create product with valid attributes" do
      assert_difference 'Product.count', 1 do
        post inventory_manager.products_url, params: { product: @valid_product_params }
      end
      assert_response :created
      json_response = JSON.parse(response.body)
      assert_equal @valid_product_params[:name], json_response["data"]["attributes"]["name"]
    end

    test "should not create product with invalid attributes" do
      assert_no_difference 'Product.count' do
        post inventory_manager.products_url, params: { product: @invalid_product_params }
      end
      assert_response :unprocessable_entity
      json_response = JSON.parse(response.body)
      assert_includes json_response["errors"], "Name can't be blank"
      assert_includes json_response["errors"], "Brand must exist"
      assert_includes json_response["errors"], "Category must exist"
    end

    test "should show product" do
      get inventory_manager.product_url(@product)
      assert_response :success
      json_response = JSON.parse(response.body)
      assert_equal @product.name, json_response["data"]["attributes"]["name"]
    end

    test "should update product with valid attributes" do
      patch inventory_manager.product_url(@product), params: { product: @valid_product_params }
      assert_response :success
      @product.reload
      assert_equal @valid_product_params[:name], @product.name
      assert_equal @valid_product_params[:description], @product.description
    end

    test "should not update product with invalid attributes" do
      patch inventory_manager.product_url(@product), params: { product: @invalid_product_params }
      assert_response :unprocessable_entity
      @product.reload
      assert_not_equal @invalid_product_params[:name], @product.name
      assert_not_equal @invalid_product_params[:description], @product.description
    end
  end
end
