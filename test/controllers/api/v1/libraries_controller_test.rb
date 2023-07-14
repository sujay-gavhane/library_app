require "test_helper"

class Api::V1::LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_library = api_v1_libraries(:one)
  end

  test "should get index" do
    get api_v1_libraries_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_library_url
    assert_response :success
  end

  test "should create api_v1_library" do
    assert_difference("Api::V1::Library.count") do
      post api_v1_libraries_url, params: { api_v1_library: {  } }
    end

    assert_redirected_to api_v1_library_url(Api::V1::Library.last)
  end

  test "should show api_v1_library" do
    get api_v1_library_url(@api_v1_library)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_library_url(@api_v1_library)
    assert_response :success
  end

  test "should update api_v1_library" do
    patch api_v1_library_url(@api_v1_library), params: { api_v1_library: {  } }
    assert_redirected_to api_v1_library_url(@api_v1_library)
  end

  test "should destroy api_v1_library" do
    assert_difference("Api::V1::Library.count", -1) do
      delete api_v1_library_url(@api_v1_library)
    end

    assert_redirected_to api_v1_libraries_url
  end
end
