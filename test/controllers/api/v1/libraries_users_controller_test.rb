require "test_helper"

class Api::V1::LibrariesUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_libraries_user = api_v1_libraries_users(:one)
  end

  test "should get index" do
    get api_v1_libraries_users_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_libraries_user_url
    assert_response :success
  end

  test "should create api_v1_libraries_user" do
    assert_difference("Api::V1::LibrariesUser.count") do
      post api_v1_libraries_users_url, params: { api_v1_libraries_user: {  } }
    end

    assert_redirected_to api_v1_libraries_user_url(Api::V1::LibrariesUser.last)
  end

  test "should show api_v1_libraries_user" do
    get api_v1_libraries_user_url(@api_v1_libraries_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_libraries_user_url(@api_v1_libraries_user)
    assert_response :success
  end

  test "should update api_v1_libraries_user" do
    patch api_v1_libraries_user_url(@api_v1_libraries_user), params: { api_v1_libraries_user: {  } }
    assert_redirected_to api_v1_libraries_user_url(@api_v1_libraries_user)
  end

  test "should destroy api_v1_libraries_user" do
    assert_difference("Api::V1::LibrariesUser.count", -1) do
      delete api_v1_libraries_user_url(@api_v1_libraries_user)
    end

    assert_redirected_to api_v1_libraries_users_url
  end
end
