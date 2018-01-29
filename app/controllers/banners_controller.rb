class BannersController < ApplicationController
  before_action :require_login

  def new
    @banner = current_user.banners.build
  end

  def create
    if banner_params[:current].present?
      current_user.banners.each {|b| b.update(current: false)}
    end

    banner = current_user.banners.new(banner_params)

    if banner.save
      redirect_to dashboard_path, notice: 'Successfully added banner.'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      format.json {
        banner = Banner.find(params[:id])

        current_user.banners.where.not(id: banner.id).each do |b|
          b.update(current: false)
        end

        render json: {
          saved: banner.update(banner_params)
        }
      }
    end

  rescue ActiveRecord::RecordNotFound
    render json: {
      saved: false
    }
  end

  private

  def banner_params
    params.require(:banner).permit(
      :title,
      :description,
      :current,
      :style
    )
  end
end
