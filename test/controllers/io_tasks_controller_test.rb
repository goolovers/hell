require 'test_helper'

class IoTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @io_task = io_tasks(:one)
  end

  test "should get index" do
    get io_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_io_task_url
    assert_response :success
  end

  test "should create io_task" do
    assert_difference('IoTask.count') do
      post io_tasks_url, params: { io_task: { apply_user_id: @io_task.apply_user_id, exec_user_id: @io_task.exec_user_id, io_at: @io_task.io_at, io_reason: @io_task.io_reason, io_type: @io_task.io_type, io_wh: @io_task.io_wh, material_product_type: @io_task.material_product_type, project_id: @io_task.project_id, status: @io_task.status } }
    end

    assert_redirected_to io_task_url(IoTask.last)
  end

  test "should show io_task" do
    get io_task_url(@io_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_io_task_url(@io_task)
    assert_response :success
  end

  test "should update io_task" do
    patch io_task_url(@io_task), params: { io_task: { apply_user_id: @io_task.apply_user_id, exec_user_id: @io_task.exec_user_id, io_at: @io_task.io_at, io_reason: @io_task.io_reason, io_type: @io_task.io_type, io_wh: @io_task.io_wh, material_product_type: @io_task.material_product_type, project_id: @io_task.project_id, status: @io_task.status } }
    assert_redirected_to io_task_url(@io_task)
  end

  test "should destroy io_task" do
    assert_difference('IoTask.count', -1) do
      delete io_task_url(@io_task)
    end

    assert_redirected_to io_tasks_url
  end
end
