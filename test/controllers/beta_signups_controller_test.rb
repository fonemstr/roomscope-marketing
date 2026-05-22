require "test_helper"

class BetaSignupsControllerTest < ActionDispatch::IntegrationTest
  test "creates beta signup from marketing page form" do
    assert_difference "BetaSignup.count", 1 do
      post beta_signups_path, params: {
        beta_signup: {
          email: "owner@example.com",
          name: "Owner Operator",
          company: "Reliable Home Tech",
          job_title: "Owner",
          team_size: "2-5",
          current_workflow: "Apple Notes, photos, and memory",
          ipads_in_field: "1"
        }
      }
    end

    signup = BetaSignup.last
    assert_equal "owner@example.com", signup.email
    assert_equal "Reliable Home Tech", signup.company
    assert signup.ipads_in_field?
    assert_redirected_to root_path(anchor: "beta")
    follow_redirect!
    assert_response :success
    assert_includes response.body, "Thanks — you’re on the RoomScope beta list."
  end

  test "does not create beta signup with invalid email" do
    assert_no_difference "BetaSignup.count" do
      post beta_signups_path, params: {
        beta_signup: {
          email: "invalid"
        }
      }
    end

    assert_response :unprocessable_content
    assert_includes response.body, "Email is invalid"
    assert_select "form[action='#{beta_signups_path}']"
  end
end
