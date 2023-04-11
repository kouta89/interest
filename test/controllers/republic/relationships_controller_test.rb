require "test_helper"

class Republic::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get republic_relationships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get republic_relationships_followers_url
    assert_response :success
  end
end
