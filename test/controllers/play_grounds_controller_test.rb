require 'test_helper'

class PlayGroundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play_ground = play_grounds(:one)
  end

  test "should get index" do
    get play_grounds_url
    assert_response :success
  end

  test "should get new" do
    get new_play_ground_url
    assert_response :success
  end

  test "should create play_ground" do
    assert_difference('PlayGround.count') do
      post play_grounds_url, params: { play_ground: { address: @play_ground.address, content: @play_ground.content, court_name: @play_ground.court_name, latitude: @play_ground.latitude, longitude: @play_ground.longitude, place: @play_ground.place, release: @play_ground.release, status: @play_ground.status, user_id: @play_ground.user_id } }
    end

    assert_redirected_to play_ground_url(PlayGround.last)
  end

  test "should show play_ground" do
    get play_ground_url(@play_ground)
    assert_response :success
  end

  test "should get edit" do
    get edit_play_ground_url(@play_ground)
    assert_response :success
  end

  test "should update play_ground" do
    patch play_ground_url(@play_ground), params: { play_ground: { address: @play_ground.address, content: @play_ground.content, court_name: @play_ground.court_name, latitude: @play_ground.latitude, longitude: @play_ground.longitude, place: @play_ground.place, release: @play_ground.release, status: @play_ground.status, user_id: @play_ground.user_id } }
    assert_redirected_to play_ground_url(@play_ground)
  end

  test "should destroy play_ground" do
    assert_difference('PlayGround.count', -1) do
      delete play_ground_url(@play_ground)
    end

    assert_redirected_to play_grounds_url
  end
end
