class User < ActiveRecord::Base
  include Clearance::User

  has_many :banners
  has_many :domains

  def banner
    banners.current
  end

  def banner_style
    banners&.current&.style
  end
end
