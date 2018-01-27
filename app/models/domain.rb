class Domain < ActiveRecord::Base
  belongs_to :user
  belongs_to :active_banner, foreign_key: "banner_id", class_name: "Banner"
end
