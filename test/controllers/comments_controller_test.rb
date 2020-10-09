require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get post_comments_url(@post)
    assert_response :success
  end

  test "unauthorized shouldn't create comment" do
    assert_no_difference('Comment.count') do
      post post_create_comment_url(@post, content: @comment.content)
    end

    assert_response :redirect
  end

  test "unauthorized shouldn't destroy comment" do
    assert_no_difference('Comment.count') do
      delete post_destroy_comment_url(@post, id: @comment)
    end

    assert_response :redirect
  end

  test "should create comment" do
    assert_difference('Comment.count', 1) do
      post post_create_comment_url(@post, content: @comment.content)
    end

    assert_response :redirect
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_destroy_comment_url(@post, id: @comment)
    end

    assert_response :success
  end

end
