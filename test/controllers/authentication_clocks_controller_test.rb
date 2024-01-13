
require "test_helper"

class AuthenticationClocksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should be redirected to the login screen if not currently authenticated" do
    get clocks_url
    assert_redirected_to user_session_path
  end
end
