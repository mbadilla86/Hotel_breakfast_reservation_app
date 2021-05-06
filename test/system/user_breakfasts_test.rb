require "application_system_test_case"

class UserBreakfastsTest < ApplicationSystemTestCase
  setup do
    @user_breakfast = user_breakfasts(:one)
  end

  test "visiting the index" do
    visit user_breakfasts_url
    assert_selector "h1", text: "User Breakfasts"
  end

  test "creating a User breakfast" do
    visit user_breakfasts_url
    click_on "New User Breakfast"

    fill_in "Breakfast", with: @user_breakfast.breakfast_id
    fill_in "Place", with: @user_breakfast.place
    fill_in "Time", with: @user_breakfast.time
    fill_in "User", with: @user_breakfast.user_id
    click_on "Create User breakfast"

    assert_text "User breakfast was successfully created"
    click_on "Back"
  end

  test "updating a User breakfast" do
    visit user_breakfasts_url
    click_on "Edit", match: :first

    fill_in "Breakfast", with: @user_breakfast.breakfast_id
    fill_in "Place", with: @user_breakfast.place
    fill_in "Time", with: @user_breakfast.time
    fill_in "User", with: @user_breakfast.user_id
    click_on "Update User breakfast"

    assert_text "User breakfast was successfully updated"
    click_on "Back"
  end

  test "destroying a User breakfast" do
    visit user_breakfasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User breakfast was successfully destroyed"
  end
end
