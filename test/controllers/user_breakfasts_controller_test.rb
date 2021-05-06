require "test_helper"

class UserBreakfastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_breakfast = user_breakfasts(:one)
  end

  test "should get index" do
    get user_breakfasts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_breakfast_url
    assert_response :success
  end

  test "should create user_breakfast" do
    assert_difference('UserBreakfast.count') do
      post user_breakfasts_url, params: { user_breakfast: { breakfast_id: @user_breakfast.breakfast_id, place: @user_breakfast.place, time: @user_breakfast.time, user_id: @user_breakfast.user_id } }
    end

    assert_redirected_to user_breakfast_url(UserBreakfast.last)
  end

  test "should show user_breakfast" do
    get user_breakfast_url(@user_breakfast)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_breakfast_url(@user_breakfast)
    assert_response :success
  end

  test "should update user_breakfast" do
    patch user_breakfast_url(@user_breakfast), params: { user_breakfast: { breakfast_id: @user_breakfast.breakfast_id, place: @user_breakfast.place, time: @user_breakfast.time, user_id: @user_breakfast.user_id } }
    assert_redirected_to user_breakfast_url(@user_breakfast)
  end

  test "should destroy user_breakfast" do
    assert_difference('UserBreakfast.count', -1) do
      delete user_breakfast_url(@user_breakfast)
    end

    assert_redirected_to user_breakfasts_url
  end
end
