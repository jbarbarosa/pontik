require "application_system_test_case"

class ClocksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @clock = clocks(:one)
  end

  test "should display a calendar with daily worked hours" do
    travel_to Time.zone.local(2000, 1, 1, 1, 1, 1)
    Clock.create user: users(:one), time: Time.zone.local(2000, 1, 3, 8)
    Clock.create user: users(:one), time: Time.zone.local(2000, 1, 3, 16, 40)
    visit clocks_url
    assert_text "January 2000"
    within "#mon-3" do
      assert_text "Mon 3"
      assert_text "8h40m"
    end
    within "#tue-4" do
      assert_text "Tue 4"
      assert_text "0h00m"
    end
  end

  test "should create clock in" do
    Clock.create user: users(:one), time: Time.zone.now
    visit clocks_url
    click_on "New clock"

    click_on "Check In"

    assert_text "Check In successful"
  end

  test "should create clock out" do
    visit clocks_url
    click_on "New clock"

    click_on "Check Out"

    assert_text "Check Out successful"
  end

  test "should update Clock" do
    visit clock_url(@clock)
    click_on "Edit this clock", match: :first

    fill_in "Time", with: Time.zone.now
    click_on "Update Clock"

    assert_text "Clock was successfully updated"
    click_on "Back"
  end

  test "should destroy Clock" do
    visit clock_url(@clock)
    click_on "Destroy this clock", match: :first

    assert_text "Clock was successfully destroyed"
  end
end
