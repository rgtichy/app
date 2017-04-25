require 'test_helper'

class SongControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get song_new_url
    assert_response :success
  end

  test "should get index" do
    get song_index_url
    assert_response :success
  end

  test "should get create" do
    get song_create_url
    assert_response :success
  end

  test "should get destroy" do
    get song_destroy_url
    assert_response :success
  end

  test "should get show" do
    get song_show_url
    assert_response :success
  end

  test "should get update" do
    get song_update_url
    assert_response :success
  end

end
