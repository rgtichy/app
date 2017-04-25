require 'test_helper'

class PlaylistControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get playlist_create_url
    assert_response :success
  end

  test "should get show" do
    get playlist_show_url
    assert_response :success
  end

end
