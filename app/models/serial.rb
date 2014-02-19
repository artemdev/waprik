class Serial < ActiveRecord::Base
  attr_accessible :cover, :description, :season, :updating, :name, :hit, :year

  mount_uploader :cover, CoverUploader

  has_many :series
  has_and_belongs_to_many :categories

  scope :hits, where(hit: true)
  scope :lastest, order("updated_at DESC")

end
