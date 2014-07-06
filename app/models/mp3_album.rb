class Mp3Album < ActiveRecord::Base
  attr_accessible :name

  has_many :tracks, class_name: 'Mp3File', foreign_key: 'album_id'

end
