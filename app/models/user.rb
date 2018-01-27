class User < ActiveRecord::Base
  include Clearance::User

  has_many :banners
  has_many :domains
end
