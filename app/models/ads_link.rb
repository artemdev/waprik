class AdsLink < ActiveRecord::Base
  attr_accessible :from, :title, :to, :expires_at

  validates :from, :title, :to, presence: true

  def active?
  	true unless self.expires_at.nil?
  end

end
