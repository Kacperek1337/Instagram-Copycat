require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @picture = fixture_file_upload('files/image.png', 'image/png')
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { description: @post.description, picture: @picture, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to profile_url(@post.user.nickname)
  end

  test "shouldn't destroy other's posts" do
    assert_difference('Post.count', 0) do
      delete post_url posts(:two)
    end

    assert_response :forbidden
  end

  test "test shouldn't get edit of other's posts" do
    get edit_post_url posts(:two)
    assert_response :forbidden
  end

  test "should create hashtags" do
    assert_difference('Hashtag.count', 2) do
      @post.picture = @picture
      @post.save!
    end
  end
end
