require 'application_system_test_case'

class ClocksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @clock = clocks(:one)
  end

  test 'visiting the index' do
    visit clocks_url
    assert_selector 'h1', text: 'Clocks'
  end

  test 'should create clock in' do
    Clock.create user: users(:one), time: Time.zone.now
    visit clocks_url
    click_on 'New clock'

    click_on 'Check In'

    assert_text 'Check In successful'
  end

  test 'should create clock out' do
    visit clocks_url
    click_on 'New clock'

    click_on 'Check Out'

    assert_text 'Check Out successful'
  end

  test 'should update Clock' do
    visit clock_url(@clock)
    click_on 'Edit this clock', match: :first

    fill_in 'Time', with: Time.zone.now
    click_on 'Update Clock'

    assert_text 'Clock was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Clock' do
    visit clock_url(@clock)
    click_on 'Destroy this clock', match: :first

    assert_text 'Clock was successfully destroyed'
  end
end
