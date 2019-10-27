require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Charge", with: @project.charge
    fill_in "End time", with: @project.end_time
    fill_in "Name", with: @project.name
    fill_in "Plan end time", with: @project.plan_end_time
    fill_in "Plan start time", with: @project.plan_start_time
    fill_in "Start time", with: @project.start_time
    fill_in "Status", with: @project.status
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Charge", with: @project.charge
    fill_in "End time", with: @project.end_time
    fill_in "Name", with: @project.name
    fill_in "Plan end time", with: @project.plan_end_time
    fill_in "Plan start time", with: @project.plan_start_time
    fill_in "Start time", with: @project.start_time
    fill_in "Status", with: @project.status
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
