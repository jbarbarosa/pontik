
require "test_helper"

class AuthenticationClocksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should be redirected to the login screen if not currently authenticated" do
    # A Table Test reduces code duplication when the expectation is the same for different inputs that must be tested separetely
    [clocks_url, edit_clock_url(clocks(:one)), new_clock_url, clock_url(clocks(:one))].each do |url| 
      get url
      assert_redirected_to user_session_path, "unauthenticated request to #{url} did not redirect to sign_in path"
    end
  end
end
