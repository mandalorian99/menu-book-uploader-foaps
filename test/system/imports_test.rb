require "application_system_test_case"

class ImportsTest < ApplicationSystemTestCase
  setup do
    @import = imports(:one)
  end

  test "visiting the index" do
    visit imports_url
    assert_selector "h1", text: "Imports"
  end

  test "should create import" do
    visit imports_url
    click_on "New import"

    fill_in "File type", with: @import.file_type
    fill_in "Filename", with: @import.filename
    fill_in "Finished at", with: @import.finished_at
    fill_in "Meta", with: @import.meta
    fill_in "Size", with: @import.size
    fill_in "Start at", with: @import.start_at
    fill_in "Status", with: @import.status
    fill_in "Total rows", with: @import.total_rows
    click_on "Create Import"

    assert_text "Import was successfully created"
    click_on "Back"
  end

  test "should update Import" do
    visit import_url(@import)
    click_on "Edit this import", match: :first

    fill_in "File type", with: @import.file_type
    fill_in "Filename", with: @import.filename
    fill_in "Finished at", with: @import.finished_at
    fill_in "Meta", with: @import.meta
    fill_in "Size", with: @import.size
    fill_in "Start at", with: @import.start_at
    fill_in "Status", with: @import.status
    fill_in "Total rows", with: @import.total_rows
    click_on "Update Import"

    assert_text "Import was successfully updated"
    click_on "Back"
  end

  test "should destroy Import" do
    visit import_url(@import)
    click_on "Destroy this import", match: :first

    assert_text "Import was successfully destroyed"
  end
end
