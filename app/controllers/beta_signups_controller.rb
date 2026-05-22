class BetaSignupsController < ApplicationController
  def create
    @beta_signup = BetaSignup.new(beta_signup_params)

    if @beta_signup.save
      redirect_to root_path(anchor: "beta"), notice: "Thanks — you’re on the RoomScope beta list."
    else
      render "marketing/show", status: :unprocessable_content
    end
  end

  private

  def beta_signup_params
    params.require(:beta_signup).permit(
      :email,
      :name,
      :company,
      :job_title,
      :team_size,
      :current_workflow,
      :ipads_in_field
    )
  end
end
