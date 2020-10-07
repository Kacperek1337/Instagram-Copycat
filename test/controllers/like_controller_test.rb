require 'test_helper'

class LikeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:two)
  end


  test "unauthorized shouldn't destroy like" do
    assert_no_difference('Like.count') do
      delete destroy_like_url posts(:one)
    end

    assert_response :redirect
  end

  test "unauthorized shouldn't create like" do
    assert_no_difference('Like.count') do
      post create_like_url @post
    end

    assert_response :redirect
  end

  test 'should create like' do
    assert_difference('Like.count', 1) do
      post create_like_url @post
    end

    assert_response :success
  end

  test 'should destroy like' do
    assert_difference('Like.count', -1) do
      delete destroy_like_url posts(:one)
    end
    
    assert_response :success
  end
end
