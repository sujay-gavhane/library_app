require "test_helper"

class Api::V1::UsersBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_users_book = api_v1_users_books(:one)
  end

  test "should get index" do
    get api_v1_users_books_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_users_book_url
    assert_response :success
  end

  test "should create api_v1_users_book" do
    assert_difference("Api::V1::UsersBook.count") do
      post api_v1_users_books_url, params: { api_v1_users_book: {  } }
    end

    assert_redirected_to api_v1_users_book_url(Api::V1::UsersBook.last)
  end

  test "should show api_v1_users_book" do
    get api_v1_users_book_url(@api_v1_users_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_users_book_url(@api_v1_users_book)
    assert_response :success
  end

  test "should update api_v1_users_book" do
    patch api_v1_users_book_url(@api_v1_users_book), params: { api_v1_users_book: {  } }
    assert_redirected_to api_v1_users_book_url(@api_v1_users_book)
  end

  test "should destroy api_v1_users_book" do
    assert_difference("Api::V1::UsersBook.count", -1) do
      delete api_v1_users_book_url(@api_v1_users_book)
    end

    assert_redirected_to api_v1_users_books_url
  end
end
