require 'test_helper'

class HashtagControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hashtag_url(hashtags(:one).name)
    assert_response :success
  end

end
