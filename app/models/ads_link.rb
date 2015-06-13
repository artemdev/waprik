# == Schema Information
#
# Table name: ads_links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  to         :string(255)
#  from       :string(255)
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  amount     :integer          default(0)
#

class AdsLink < ActiveRecord::Base
  attr_accessible :from, :title, :to, :expires_at

  validates :from, :title, :to, presence: true

  def active?
  	true unless self.expires_at.nil?
  end

  def count_conversion!
  	self.amount += 1
  	save!
  end

end
