require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Brand", with: @product.brand
    fill_in "Material code", with: @product.material_code
    fill_in "Material name", with: @product.material_name
    fill_in "Material type", with: @product.material_type
    fill_in "Num", with: @product.num
    fill_in "Remark", with: @product.remark
    fill_in "Specs", with: @product.specs
    fill_in "Supplier", with: @product.supplier
    fill_in "Unit", with: @product.unit
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @product.brand
    fill_in "Material code", with: @product.material_code
    fill_in "Material name", with: @product.material_name
    fill_in "Material type", with: @product.material_type
    fill_in "Num", with: @product.num
    fill_in "Remark", with: @product.remark
    fill_in "Specs", with: @product.specs
    fill_in "Supplier", with: @product.supplier
    fill_in "Unit", with: @product.unit
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
