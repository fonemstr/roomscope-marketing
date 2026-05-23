require "test_helper"

class Admin::BetaSignupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @old_admin_username = ENV["ADMIN_USERNAME"]
    @old_admin_password = ENV["ADMIN_PASSWORD"]
    ENV["ADMIN_USERNAME"] = "admin"
    ENV["ADMIN_PASSWORD"] = "secret-password"
  end

  teardown do
    ENV["ADMIN_USERNAME"] = @old_admin_username
    ENV["ADMIN_PASSWORD"] = @old_admin_password
  end

  test "requires admin authentication" do
    get admin_beta_signups_path

    assert_response :unauthorized
    assert_includes response.headers["WWW-Authenticate"], "RoomScope Admin"
  end

  test "lists beta signups for authenticated admin" do
    older = BetaSignup.create!(
      email: "older@example.com",
      name: "Older Lead",
      company: "Older Home Tech",
      job_title: "Estimator",
      team_size: "2-5",
      current_workflow: "Paper notes",
      ipads_in_field: false,
      created_at: 2.days.ago
    )
    newer = BetaSignup.create!(
      email: "newer@example.com",
      name: "Newer Lead",
      company: "Newer Home Tech",
      job_title: "Owner",
      team_size: "6-10",
      current_workflow: "Apple Notes and photos",
      ipads_in_field: true,
      created_at: 1.day.ago
    )

    get admin_beta_signups_path, headers: admin_auth_headers

    assert_response :success
    assert_select "h1", "Beta signups"
    assert_includes response.body, newer.email
    assert_includes response.body, older.email
    assert_includes response.body, "Newer Home Tech"
    assert_includes response.body, "Apple Notes and photos"
    assert_operator response.body.index(newer.email), :<, response.body.index(older.email)
  end

  test "exports beta signups as csv for authenticated admin" do
    BetaSignup.create!(
      email: "csv@example.com",
      name: "CSV Lead",
      company: "CSV Home Tech",
      job_title: "Owner",
      team_size: "1",
      current_workflow: "Notes",
      ipads_in_field: true
    )

    get admin_beta_signups_path(format: :csv), headers: admin_auth_headers

    assert_response :success
    assert_equal "text/csv", response.media_type
    assert_includes response.body, "created_at,email,name,company,job_title,team_size,ipads_in_field,current_workflow"
    assert_includes response.body, "csv@example.com"
    assert_includes response.body, "CSV Home Tech"
  end

  private

  def admin_auth_headers
    {
      "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials("admin", "secret-password")
    }
  end
end
