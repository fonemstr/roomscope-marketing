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
    assert_select "form[action='#{beta_signups_path}']"
    assert_select "input[name='beta_signup[email]']"
    assert_select "input[name='beta_signup[ipads_in_field]']"
    assert_select "button", text: /Join the beta/
  end

  test "sitemap lists canonical public URLs" do
    get "/sitemap.xml"

    assert_response :success
    assert_equal "application/xml", response.media_type
    assert_includes response.body, "<loc>https://getroomscope.com/</loc>"
    assert_no_match(/www\.getroomscope\.com/, response.body)
  end

  test "robots advertises canonical sitemap" do
    get "/robots.txt"

    assert_response :success
    assert_includes response.body, "Sitemap: https://getroomscope.com/sitemap.xml"
  end
end
