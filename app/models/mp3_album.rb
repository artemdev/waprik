class Mp3Album < ActiveRecord::Base
  attr_accessible :name

  before_create { |artist| artist.name = artist.name.mb_chars.downcase }

  has_many :tracks, class_name: 'Mp3File', foreign_key: 'album_id'

  belongs_to :artist, class_name: 'Mp3Artist', foreign_key: 'artist_id'

end
