require "test_helper"

class BetaSignupTest < ActiveSupport::TestCase
  test "valid with email and optional field context" do
    signup = BetaSignup.new(
      email: "designer@example.com",
      name: "Dana Designer",
      company: "North Ridge AV",
      job_title: "Sales designer",
      team_size: "2-5",
      current_workflow: "Apple Notes and CompanyCam",
      ipads_in_field: true
    )

    assert signup.valid?
  end

  test "requires email" do
    signup = BetaSignup.new

    assert_not signup.valid?
    assert_includes signup.errors[:email], "can't be blank"
  end

  test "requires a valid email format" do
    signup = BetaSignup.new(email: "not-an-email")

    assert_not signup.valid?
    assert_includes signup.errors[:email], "is invalid"
  end

  test "normalizes email before validation" do
    signup = BetaSignup.create!(email: "  DESIGNER@EXAMPLE.COM  ")

    assert_equal "designer@example.com", signup.email
  end
end
