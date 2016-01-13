class Banner < ActiveRecord::Base
  belongs_to :user
  has_one :domain

  scope :current, -> { where(current: true).take }
end
