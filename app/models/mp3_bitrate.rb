# == Schema Information
#
# Table name: mp3_bitrate
#
#  file_id      :integer
#  file_bitrate :integer
#  file_size    :string(16)
#  file         :string(255)
#

# integer "file_id",                   
# integer "file_bitrate",              
# string  "file_size",    :limit => 16,
# string  "file"
class Mp3Bitrate < ActiveRecord::Base
  attr_accessible :file_bitrate
  self.table_name = "mp3_bitrate"

  mount_uploader :file, Mp3BitrateUploader
  
  belongs_to :track, class_name: 'Mp3File', foreign_key: 'file_id'


end
