# == Schema Information
#
# Table name: mp3_albums
#
#  id                 :integer          not null, primary key
#  artist_id          :integer          default(0)
#  name               :string(256)
#  year               :string(4)        default("0000")
#  count_tracks       :integer          default(0)
#  album_comment_up   :text
#  album_comment_down :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Mp3Album < ActiveRecord::Base
  attr_accessible :name

  before_create { |artist| artist.name = artist.name.mb_chars.downcase }

  has_many :tracks, class_name: 'Mp3File', foreign_key: 'album_id'

  belongs_to :artist, class_name: 'Mp3Artist', foreign_key: 'artist_id'

end
