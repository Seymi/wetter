require 'test_helper'

class PinnacleFeedsControllerTest < ActionController::TestCase
  setup do
    @pinnacle_feed = pinnacle_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pinnacle_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pinnacle_feed" do
    assert_difference('PinnacleFeed.count') do
      post :create, pinnacle_feed: { last_contest: @pinnacle_feed.last_contest, last_game: @pinnacle_feed.last_game, pinnacle_feed_time: @pinnacle_feed.pinnacle_feed_time, sport_sub_type: @pinnacle_feed.sport_sub_type, sport_type: @pinnacle_feed.sport_type }
    end

    assert_redirected_to pinnacle_feed_path(assigns(:pinnacle_feed))
  end

  test "should show pinnacle_feed" do
    get :show, id: @pinnacle_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pinnacle_feed
    assert_response :success
  end

  test "should update pinnacle_feed" do
    put :update, id: @pinnacle_feed, pinnacle_feed: { last_contest: @pinnacle_feed.last_contest, last_game: @pinnacle_feed.last_game, pinnacle_feed_time: @pinnacle_feed.pinnacle_feed_time, sport_sub_type: @pinnacle_feed.sport_sub_type, sport_type: @pinnacle_feed.sport_type }
    assert_redirected_to pinnacle_feed_path(assigns(:pinnacle_feed))
  end

  test "should destroy pinnacle_feed" do
    assert_difference('PinnacleFeed.count', -1) do
      delete :destroy, id: @pinnacle_feed
    end

    assert_redirected_to pinnacle_feeds_path
  end
end
