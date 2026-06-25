require "test_helper"

class MarketingControllerTest < ActionDispatch::IntegrationTest
  test "roomscope app apex redirects permanently to canonical getroomscope host" do
    host! "roomscope.app"

    get "/privacy", params: { ref: "dns" }

    assert_response :moved_permanently
    assert_redirected_to "https://getroomscope.com/privacy?ref=dns"
  end

  test "roomscope app www redirects permanently to canonical getroomscope host" do
    host! "www.roomscope.app"

    get "/support"

    assert_response :moved_permanently
    assert_redirected_to "https://getroomscope.com/support"
  end

  test "canonical getroomscope host does not redirect" do
    host! "getroomscope.com"

    get root_path

    assert_response :success
  end

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
    assert_includes response.body, "<loc>https://getroomscope.com/privacy</loc>"
    assert_includes response.body, "<loc>https://getroomscope.com/support</loc>"
    assert_no_match(/www\.getroomscope\.com/, response.body)
  end

  test "privacy page supports App Store privacy policy URL" do
    get privacy_path

    assert_response :success
    assert_select "title", /Privacy Policy/
    assert_select "h1", "Privacy Policy"
    assert_includes response.body, "RoomScope stores site survey projects on your device"
    assert_includes response.body, "support@getroomscope.com"
  end

  test "support page supports App Store support URL" do
    get support_path

    assert_response :success
    assert_select "title", /Support/
    assert_select "h1", "RoomScope Support"
    assert_includes response.body, "support@getroomscope.com"
    assert_includes response.body, "Solo Pro"
  end

  test "robots advertises canonical sitemap" do
    get "/robots.txt"

    assert_response :success
    assert_includes response.body, "Sitemap: https://getroomscope.com/sitemap.xml"
  end
end
