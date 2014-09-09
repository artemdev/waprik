# == Schema Information
#
# Table name: video_files
#
#  id         :integer          not null, primary key
#  video_id   :integer
#  quality_id :integer
#  format_id  :integer
#  size       :integer
#  attach     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VideoFile < ActiveRecord::Base
	include Convertation

  attr_accessible :attach

  mount_uploader :attach, VideosUploader

 	belongs_to :video
 	belongs_to :format, class_name: "FilmFormat"
  belongs_to :quality, class_name: "FilmQuality"

end
