require 'test_helper'

class MistakesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @mistake = mistakes(:one)
    sign_in @user
  end

  test "should get index" do
    get mistakes_url
    assert_response :success
  end

  test "should get new" do
    get new_mistake_url
    assert_response :success
  end

  test "should create mistake" do
    assert_difference('Mistake.count') do
      post mistakes_url, params: {
        mistake: {
          description: @mistake.description,
          description_rating: @mistake.description_rating,
          reflection: @mistake.reflection,
          reflection_rating: @mistake.reflection_rating,
          reminder_date: @mistake.reminder_date
        }
      }
    end

    assert_redirected_to mistake_url(Mistake.last)
  end

  test "should show mistake" do
    get mistake_url(@mistake)
    assert_response :success
  end

  test "should get edit" do
    get edit_mistake_url(@mistake)
    assert_response :success
  end

  test "should update mistake" do
    patch mistake_url(@mistake), params: {
      mistake: {
        description: @mistake.description,
        description_rating: @mistake.description_rating,
        reflection: @mistake.reflection,
        reflection_rating: @mistake.reflection_rating,
        reminder_date: @mistake.reminder_date,
      }
    }
    assert_redirected_to mistake_url(@mistake)
  end

  test "should destroy mistake" do
    assert_difference('Mistake.count', -1) do
      delete mistake_url(@mistake)
    end

    assert_redirected_to mistakes_url
  end

  test "should successfully get the add_reflection page" do
    get add_reflection_mistake_url(@mistake)
    assert_response :success
  end
end
