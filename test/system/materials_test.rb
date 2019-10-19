require "application_system_test_case"

class MaterialsTest < ApplicationSystemTestCase
  setup do
    @material = materials(:one)
  end

  test "visiting the index" do
    visit materials_url
    assert_selector "h1", text: "Materials"
  end

  test "creating a Material" do
    visit materials_url
    click_on "New Material"

    fill_in "After tax", with: @material.after_tax
    fill_in "Before tax", with: @material.before_tax
    fill_in "Brand", with: @material.brand
    fill_in "Material code", with: @material.material_code
    fill_in "Material name", with: @material.material_name
    fill_in "Material type", with: @material.material_type
    fill_in "Num", with: @material.num
    fill_in "Remark", with: @material.remark
    fill_in "Specs", with: @material.specs
    fill_in "Supplier", with: @material.supplier
    fill_in "Tax rate", with: @material.tax_rate
    fill_in "Unit", with: @material.unit
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "updating a Material" do
    visit materials_url
    click_on "Edit", match: :first

    fill_in "After tax", with: @material.after_tax
    fill_in "Before tax", with: @material.before_tax
    fill_in "Brand", with: @material.brand
    fill_in "Material code", with: @material.material_code
    fill_in "Material name", with: @material.material_name
    fill_in "Material type", with: @material.material_type
    fill_in "Num", with: @material.num
    fill_in "Remark", with: @material.remark
    fill_in "Specs", with: @material.specs
    fill_in "Supplier", with: @material.supplier
    fill_in "Tax rate", with: @material.tax_rate
    fill_in "Unit", with: @material.unit
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "destroying a Material" do
    visit materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material was successfully destroyed"
  end
end
