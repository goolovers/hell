require "application_system_test_case"

class IoTasksTest < ApplicationSystemTestCase
  setup do
    @io_task = io_tasks(:one)
  end

  test "visiting the index" do
    visit io_tasks_url
    assert_selector "h1", text: "Io Tasks"
  end

  test "creating a Io task" do
    visit io_tasks_url
    click_on "New Io Task"

    fill_in "Apply user", with: @io_task.apply_user_id
    fill_in "Exec user", with: @io_task.exec_user_id
    fill_in "Io at", with: @io_task.io_at
    fill_in "Io reason", with: @io_task.io_reason
    fill_in "Io type", with: @io_task.io_type
    fill_in "Io wh", with: @io_task.io_wh
    fill_in "Material product type", with: @io_task.material_product_type
    fill_in "Project", with: @io_task.project_id
    fill_in "Status", with: @io_task.status
    click_on "Create Io task"

    assert_text "Io task was successfully created"
    click_on "Back"
  end

  test "updating a Io task" do
    visit io_tasks_url
    click_on "Edit", match: :first

    fill_in "Apply user", with: @io_task.apply_user_id
    fill_in "Exec user", with: @io_task.exec_user_id
    fill_in "Io at", with: @io_task.io_at
    fill_in "Io reason", with: @io_task.io_reason
    fill_in "Io type", with: @io_task.io_type
    fill_in "Io wh", with: @io_task.io_wh
    fill_in "Material product type", with: @io_task.material_product_type
    fill_in "Project", with: @io_task.project_id
    fill_in "Status", with: @io_task.status
    click_on "Update Io task"

    assert_text "Io task was successfully updated"
    click_on "Back"
  end

  test "destroying a Io task" do
    visit io_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Io task was successfully destroyed"
  end
end
