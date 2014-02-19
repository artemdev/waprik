class Attachment < ActiveRecord::Base
  attr_accessible :low_3gp, :mp4_320, :mp4_640
  
  mount_uploader :low_3gp, VideosUploader
  mount_uploader :mp4_320, VideosUploader
  mount_uploader :mp4_640, VideosUploader


  belongs_to :serial
end
