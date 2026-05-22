class MarketingController < ApplicationController
  def show
    @beta_signup = BetaSignup.new
  end
end
