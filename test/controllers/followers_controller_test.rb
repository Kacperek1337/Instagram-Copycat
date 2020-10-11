require 'test_helper'

class FollowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_user = users(:two)
  end

  # test "should follow once" do
  #   assert_difference('Follow.count', 1) do
  #     5.times do
  #       post create_follow_url(@other_user)
  #     end
  #   end

  #   assert_includes @other_user.followers, @user
  #   assert_response :not_acceptable
  # end

  # test "should unfollow" do
  #   @user.follows.create!(following: @other_user)

  #   assert_difference('Follow.count', -1) do
  #     delete destroy_follow_url(@other_user)
  #   end

  #   assert_response :success
  # end
end
