require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "unauthenticated should get index" do
    get index_url
    assert_response :success
  end

end
