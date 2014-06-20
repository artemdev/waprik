# string    "ftp_path",          :limit => 256,                     
# string    "path",              :limit => 256,                     
# string    "name",              :limit => 256,                     
# string    "fname",             :limit => 256,                     
# string    "length",            :limit => 5,   :default => "00:00",
# timestamp "created_at",                                           
# integer   "genre_id",                                             
# integer   "artist_id",                        :default => 0,      
# integer   "album_id",                         :default => 0,      
# integer   "order",                                                
# integer   "order_nomination",                 :default => 0,      
# string    "hit",               :limit => 1,   :default => "0",    
# timestamp "file_hit_date"
# string    "new",               :limit => 1,   :default => "0",    
# integer   "downloads",                        :default => 0,      
class Mp3File < ActiveRecord::Base
  attr_accessible :name

  mount_uploader :path, Mp3Uploader

  has_many :bitrates, class_name: 'Mp3Bitrate', foreign_key: 'file_id'
  belongs_to :artist, class_name: 'Mp3Artist'
  belongs_to :album, class_name: 'Mp3Album'

end
