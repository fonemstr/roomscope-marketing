class ApplicationController < ActionController::Base
  CANONICAL_HOST = "getroomscope.com"
  REDIRECT_HOSTS = %w[roomscope.app www.roomscope.app].freeze

  before_action :redirect_roomscope_app_to_canonical_host

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def redirect_roomscope_app_to_canonical_host
    return unless REDIRECT_HOSTS.include?(request.host)

    status = request.get? || request.head? ? :moved_permanently : :permanent_redirect

    redirect_to "https://#{CANONICAL_HOST}#{request.fullpath}", status:, allow_other_host: true
  end
end
