require 'test_helper'

class StorageProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_product = storage_products(:one)
  end

  test "should get index" do
    get storage_products_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_product_url
    assert_response :success
  end

  test "should create storage_product" do
    assert_difference('StorageProduct.count') do
      post storage_products_url, params: { storage_product: { num: @storage_product.num, product_id: @storage_product.product_id } }
    end

    assert_redirected_to storage_product_url(StorageProduct.last)
  end

  test "should show storage_product" do
    get storage_product_url(@storage_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_product_url(@storage_product)
    assert_response :success
  end

  test "should update storage_product" do
    patch storage_product_url(@storage_product), params: { storage_product: { num: @storage_product.num, product_id: @storage_product.product_id } }
    assert_redirected_to storage_product_url(@storage_product)
  end

  test "should destroy storage_product" do
    assert_difference('StorageProduct.count', -1) do
      delete storage_product_url(@storage_product)
    end

    assert_redirected_to storage_products_url
  end
end
