require "application_system_test_case"

class StorageMaterialsTest < ApplicationSystemTestCase
  setup do
    @storage_material = storage_materials(:one)
  end

  test "visiting the index" do
    visit storage_materials_url
    assert_selector "h1", text: "Storage Materials"
  end

  test "creating a Storage material" do
    visit storage_materials_url
    click_on "New Storage Material"

    fill_in "Material", with: @storage_material.material_id
    fill_in "Num", with: @storage_material.num
    click_on "Create Storage material"

    assert_text "Storage material was successfully created"
    click_on "Back"
  end

  test "updating a Storage material" do
    visit storage_materials_url
    click_on "Edit", match: :first

    fill_in "Material", with: @storage_material.material_id
    fill_in "Num", with: @storage_material.num
    click_on "Update Storage material"

    assert_text "Storage material was successfully updated"
    click_on "Back"
  end

  test "destroying a Storage material" do
    visit storage_materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Storage material was successfully destroyed"
  end
end
