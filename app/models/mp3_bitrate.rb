# integer "file_id",                   
# integer "file_bitrate",              
# string  "file_size",    :limit => 16,
class Mp3Bitrate < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = "mp3_bitrate"

  belongs_to :track, class_name: 'Mp3File'

end
