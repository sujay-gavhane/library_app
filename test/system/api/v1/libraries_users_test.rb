require "application_system_test_case"

class Api::V1::LibrariesUsersTest < ApplicationSystemTestCase
  setup do
    @api_v1_libraries_user = api_v1_libraries_users(:one)
  end

  test "visiting the index" do
    visit api_v1_libraries_users_url
    assert_selector "h1", text: "Libraries users"
  end

  test "should create libraries user" do
    visit api_v1_libraries_users_url
    click_on "New libraries user"

    click_on "Create Libraries user"

    assert_text "Libraries user was successfully created"
    click_on "Back"
  end

  test "should update Libraries user" do
    visit api_v1_libraries_user_url(@api_v1_libraries_user)
    click_on "Edit this libraries user", match: :first

    click_on "Update Libraries user"

    assert_text "Libraries user was successfully updated"
    click_on "Back"
  end

  test "should destroy Libraries user" do
    visit api_v1_libraries_user_url(@api_v1_libraries_user)
    click_on "Destroy this libraries user", match: :first

    assert_text "Libraries user was successfully destroyed"
  end
end
