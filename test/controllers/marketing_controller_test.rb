require "test_helper"

class MarketingControllerTest < ActionDispatch::IntegrationTest
  test "homepage markets RoomScope for iPad field surveys" do
    get root_path

    assert_response :success
    assert_select "title", /RoomScope/
    assert_select "h1", /Room-by-room site surveys/
    assert_includes response.body, "iPhone and iPad"
    assert_includes response.body, "home technology pros"
    assert_includes response.body, "estimator handoff"
    assert_includes response.body, "customer-ready PDF"
    assert_select "a", text: /Request early access/
  end
end
