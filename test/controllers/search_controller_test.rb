require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get search_url 'test'
    assert_response :success
  end

end
