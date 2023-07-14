require "application_system_test_case"

class Api::V1::LibrariesTest < ApplicationSystemTestCase
  setup do
    @api_v1_library = api_v1_libraries(:one)
  end

  test "visiting the index" do
    visit api_v1_libraries_url
    assert_selector "h1", text: "Libraries"
  end

  test "should create library" do
    visit api_v1_libraries_url
    click_on "New library"

    click_on "Create Library"

    assert_text "Library was successfully created"
    click_on "Back"
  end

  test "should update Library" do
    visit api_v1_library_url(@api_v1_library)
    click_on "Edit this library", match: :first

    click_on "Update Library"

    assert_text "Library was successfully updated"
    click_on "Back"
  end

  test "should destroy Library" do
    visit api_v1_library_url(@api_v1_library)
    click_on "Destroy this library", match: :first

    assert_text "Library was successfully destroyed"
  end
end
