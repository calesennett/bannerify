class User < ActiveRecord::Base
  include Clearance::User

  has_many :banners
  has_many :domains

  def banner
    banners.current&.first
  end

  def banner_style
    banner&.style
  end
end
