require 'test_helper'

class PCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @p_code = p_codes(:one)
  end

  test "should get index" do
    get p_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_p_code_url
    assert_response :success
  end

  test "should create p_code" do
    assert_difference('PCode.count') do
      post p_codes_url, params: { p_code: { code: @p_code.code, name: @p_code.name, type_code: @p_code.type_code } }
    end

    assert_redirected_to p_code_url(PCode.last)
  end

  test "should show p_code" do
    get p_code_url(@p_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_p_code_url(@p_code)
    assert_response :success
  end

  test "should update p_code" do
    patch p_code_url(@p_code), params: { p_code: { code: @p_code.code, name: @p_code.name, type_code: @p_code.type_code } }
    assert_redirected_to p_code_url(@p_code)
  end

  test "should destroy p_code" do
    assert_difference('PCode.count', -1) do
      delete p_code_url(@p_code)
    end

    assert_redirected_to p_codes_url
  end
end
