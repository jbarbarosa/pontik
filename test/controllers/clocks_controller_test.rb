require "test_helper"

class ClocksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @clock = clocks(:one)
  end

  test "should get index" do
    get clocks_url
    assert_response :success
  end

  test "should get new" do
    get new_clock_url
    assert_response :success
  end

  test "should create clock" do
    assert_difference("Clock.count") do
      post clocks_url
    end

    assert_redirected_to clock_url(Clock.last)
  end

  test "should show clock" do
    get clock_url(@clock)
    assert_response :success
  end

  test "should get edit" do
    get edit_clock_url(@clock)
    assert_response :success
  end

  test "should update clock" do
    patch clock_url(@clock), params: { clock: { time: Time.zone.now } }
    assert_redirected_to clock_url(@clock)
  end

  test "should destroy clock" do
    assert_difference("Clock.count", -1) do
      delete clock_url(@clock)
    end

    assert_redirected_to clocks_url
  end
end
