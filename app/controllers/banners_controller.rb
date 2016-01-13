class BannersController < ApplicationController
  before_action :require_login

  def new
    @banner = current_user.banners.build
  end

  def create
    banner = current_user.banners.new(banner_params)

    if banner.save
      redirect_to dashboard_path, notice: 'Successfully added banner.'
    else
      render 'new'
    end
  end

  private

  def banner_params
    params.require(:banner).permit(
      :title,
      :description,
      :current
    )
  end
end
