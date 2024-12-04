require "../test_helper"
module InventoryManager
  class BrandsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @brand = InventoryManager::Brand.create!(
        name: "Test Brand", 
        manufacturer: "Test Manufacturer", 
        manufacturer_email: "test@example.com", 
        manufacturer_office: "Test Office"
      )
      @valid_attributes = {
        name: "New Brand",
        manufacturer: "New Manufacturer",
        manufacturer_email: "new@example.com",
        manufacturer_office: "New Office"
      }
      @invalid_attributes = { name: "" } # Missing required fields
    end

    test "should get index" do
      get inventory_manager.brands_url, as: :json
      assert_response :success
      response_body = JSON.parse(response.body)
      assert_equal @brand.name, response_body["data"].first["attributes"]["name"]
    end

    test "should show brand" do
      get inventory_manager.brand_url(@brand), as: :json
      assert_response :success
      response_body = JSON.parse(response.body)
      assert_equal @brand.name, response_body["data"]["attributes"]["name"]
    end

    test "should create brand with valid attributes" do
      assert_difference("InventoryManager::Brand.count", 1) do
        post inventory_manager.brands_url, params: { brand: @valid_attributes }, as: :json
      end
      assert_response :created
      response_body = JSON.parse(response.body)
      assert_equal @valid_attributes[:name], response_body["data"]["attributes"]["name"]
    end

    test "should not create brand with invalid attributes" do
      assert_no_difference("InventoryManager::Brand.count") do
        post inventory_manager.brands_url, params: { brand: @invalid_attributes }, as: :json
      end
      assert_response :unprocessable_entity
      response_body = JSON.parse(response.body)
      assert_includes response_body["errors"], "Name can't be blank"
    end

    test "should update brand with valid attributes" do
      patch inventory_manager.brand_url(@brand), params: { brand: { name: "Updated Brand" } }, as: :json
      assert_response :success
      @brand.reload
      assert_equal "Updated Brand", @brand.name
    end

    test "should not update brand with invalid attributes" do
      patch inventory_manager.brand_url(@brand), params: { brand: { name: "" } }, as: :json
      assert_response :unprocessable_entity
      @brand.reload
      assert_not_equal "", @brand.name
    end
  end
end
