require "application_system_test_case"

class StorageProductsTest < ApplicationSystemTestCase
  setup do
    @storage_product = storage_products(:one)
  end

  test "visiting the index" do
    visit storage_products_url
    assert_selector "h1", text: "Storage Products"
  end

  test "creating a Storage product" do
    visit storage_products_url
    click_on "New Storage Product"

    fill_in "Num", with: @storage_product.num
    fill_in "Product", with: @storage_product.product_id
    click_on "Create Storage product"

    assert_text "Storage product was successfully created"
    click_on "Back"
  end

  test "updating a Storage product" do
    visit storage_products_url
    click_on "Edit", match: :first

    fill_in "Num", with: @storage_product.num
    fill_in "Product", with: @storage_product.product_id
    click_on "Update Storage product"

    assert_text "Storage product was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage product" do
    visit storage_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage product was successfully destroyed"
  end
end
