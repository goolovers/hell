require 'test_helper'

class StorageMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storage_material = storage_materials(:one)
  end

  test "should get index" do
    get storage_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_storage_material_url
    assert_response :success
  end

  test "should create storage_material" do
    assert_difference('StorageMaterial.count') do
      post storage_materials_url, params: { storage_material: { material_id: @storage_material.material_id, num: @storage_material.num } }
    end

    assert_redirected_to storage_material_url(StorageMaterial.last)
  end

  test "should show storage_material" do
    get storage_material_url(@storage_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_storage_material_url(@storage_material)
    assert_response :success
  end

  test "should update storage_material" do
    patch storage_material_url(@storage_material), params: { storage_material: { material_id: @storage_material.material_id, num: @storage_material.num } }
    assert_redirected_to storage_material_url(@storage_material)
  end

  test "should destroy storage_material" do
    assert_difference('StorageMaterial.count', -1) do
      delete storage_material_url(@storage_material)
    end

    assert_redirected_to storage_materials_url
  end
end
