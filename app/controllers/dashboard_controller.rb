class DashboardController < ApplicationController
  before_action :require_login

  def index
    @banners = current_user.banners.order(updated_at: :desc)
  end
end
