require "application_system_test_case"

class Api::V1::UsersBooksTest < ApplicationSystemTestCase
  setup do
    @api_v1_users_book = api_v1_users_books(:one)
  end

  test "visiting the index" do
    visit api_v1_users_books_url
    assert_selector "h1", text: "Users books"
  end

  test "should create users book" do
    visit api_v1_users_books_url
    click_on "New users book"

    click_on "Create Users book"

    assert_text "Users book was successfully created"
    click_on "Back"
  end

  test "should update Users book" do
    visit api_v1_users_book_url(@api_v1_users_book)
    click_on "Edit this users book", match: :first

    click_on "Update Users book"

    assert_text "Users book was successfully updated"
    click_on "Back"
  end

  test "should destroy Users book" do
    visit api_v1_users_book_url(@api_v1_users_book)
    click_on "Destroy this users book", match: :first

    assert_text "Users book was successfully destroyed"
  end
end
