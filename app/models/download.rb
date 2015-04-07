# == Schema Information
#
# Table name: downloads
#
#  id                :integer          not null, primary key
#  downloadable_id   :integer
#  downloadable_type :string(255)
#  user_agent        :string(255)
#  created_at        :datetime
#

class Download < ActiveRecord::Base
  attr_accessible :user_agent
  belongs_to :downloadable, polymorphic: true

  scope :today, -> { where("created_at >= ?", Time.now.beginning_of_day) }

end
