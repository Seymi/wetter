require 'test_helper'

class PinFeesControllerTest < ActionController::TestCase
  test "should get read_feed" do
    get :read_feed
    assert_response :success
  end

end
