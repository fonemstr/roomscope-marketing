require "csv"

module Admin
  class BetaSignupsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @beta_signups = BetaSignup.order(created_at: :desc)

      respond_to do |format|
        format.html
        format.csv do
          send_data beta_signups_csv,
                    filename: "roomscope-beta-signups-#{Date.current}.csv",
                    type: "text/csv"
        end
      end
    end

    private

    def authenticate_admin!
      authenticate_or_request_with_http_basic("RoomScope Admin") do |username, password|
        expected_username = ENV.fetch("ADMIN_USERNAME", "admin")
        expected_password = ENV["ADMIN_PASSWORD"].to_s

        expected_password.present? &&
          secure_compare(username, expected_username) &&
          secure_compare(password, expected_password)
      end
    end

    def secure_compare(value, expected_value)
      ActiveSupport::SecurityUtils.secure_compare(
        Digest::SHA256.hexdigest(value.to_s),
        Digest::SHA256.hexdigest(expected_value.to_s)
      )
    end

    def beta_signups_csv
      CSV.generate(headers: true) do |csv|
        csv << [
          "created_at",
          "email",
          "name",
          "company",
          "job_title",
          "team_size",
          "ipads_in_field",
          "current_workflow"
        ]

        @beta_signups.each do |signup|
          csv << [
            signup.created_at&.iso8601,
            signup.email,
            signup.name,
            signup.company,
            signup.job_title,
            signup.team_size,
            signup.ipads_in_field,
            signup.current_workflow
          ]
        end
      end
    end
  end
end
