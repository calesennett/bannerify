class Banner < ActiveRecord::Base
  belongs_to :user
  has_one :domain

  def self.current
    where(current: true).take
  end
end
