class Mp3Artist < ActiveRecord::Base
  attr_accessible :name

  has_many :tracks, class_name: 'Mp3File', foreign_key: 'artist_id'
  has_many :albums, class_name: 'Mp3Album', foreign_key: 'artist_id'

  scope :eng, where(lang: "eng")
  scope :rus, where(lang: "rus")
  scope :sorted, order("first_letter")
end
