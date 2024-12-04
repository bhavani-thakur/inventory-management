require "../test_helper"

module InventoryManager
  class CategoriesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @category = Category.create!(name: "Electronics", description: "All electronic items")
      @invalid_category_params = { name: "", description: "" }
      @valid_category_params = { name: "Clothing", description: "All clothing items" }
    end

    test "should get index" do
      get inventory_manager.categories_url
      assert_response :success
      assert_not_empty response.body
    end

    test "should create category with valid attributes" do
      assert_difference('Category.count', 1) do
        post inventory_manager.categories_url, params: { category: @valid_category_params }
      end
      assert_response :created
      category = Category.last
      assert_equal @valid_category_params[:name], category.name
      assert_equal @valid_category_params[:description], category.description
    end

    test "should not create category with invalid attributes" do
      assert_no_difference('Category.count') do
        post inventory_manager.categories_url, params: { category: @invalid_category_params }
      end
      assert_response :unprocessable_entity
      assert_includes response.body, "Name can't be blank"
    end

    test "should show category" do
      get inventory_manager.category_url(@category)
      assert_response :success
      category_data = JSON.parse(response.body)
      assert_equal @category.name, category_data['data']['attributes']['name']
      assert_equal @category.description, category_data['data']['attributes']['description']
    end

    test "should update category with valid attributes" do
      patch inventory_manager.category_url(@category), params: { category: @valid_category_params }
      assert_response :success
      @category.reload
      assert_equal @valid_category_params[:name], @category.name
      assert_equal @valid_category_params[:description], @category.description
    end

    test "should not update category with invalid attributes" do
      patch inventory_manager.category_url(@category), params: { category: @invalid_category_params }
      assert_response :unprocessable_entity
      @category.reload
      assert_not_equal @invalid_category_params[:name], @category.name
      assert_not_equal @invalid_category_params[:description], @category.description
    end
  end
end
