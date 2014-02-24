class Attachment < ActiveRecord::Base
  attr_accessible :low_3gp, :mp4_320, :mp4_640
  
  mount_uploader :low_3gp, SerialsUploader
  mount_uploader :mp4_320, SerialsUploader
  mount_uploader :mp4_640, SerialsUploader


  belongs_to :serial
  
end
