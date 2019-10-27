require "application_system_test_case"

class PCodesTest < ApplicationSystemTestCase
  setup do
    @p_code = p_codes(:one)
  end

  test "visiting the index" do
    visit p_codes_url
    assert_selector "h1", text: "P Codes"
  end

  test "creating a P code" do
    visit p_codes_url
    click_on "New P Code"

    fill_in "Code", with: @p_code.code
    fill_in "Name", with: @p_code.name
    fill_in "Type code", with: @p_code.type_code
    click_on "Create P code"

    assert_text "P code was successfully created"
    click_on "Back"
  end

  test "updating a P code" do
    visit p_codes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @p_code.code
    fill_in "Name", with: @p_code.name
    fill_in "Type code", with: @p_code.type_code
    click_on "Update P code"

    assert_text "P code was successfully updated"
    click_on "Back"
  end

  test "destroying a P code" do
    visit p_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "P code was successfully destroyed"
  end
end
