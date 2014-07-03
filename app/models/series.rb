class Series < ActiveRecord::Base
  attr_accessible :name, :release_date, :number, :low_3gp, :mp4_320, :mp4_640, :serial_id, :ftp_mp4_320, :ftp_mp4_640, :ftp_low_3gp
  attr_accessor :ftp_mp4_320, :ftp_mp4_640, :ftp_low_3gp

  belongs_to :serial

  mount_uploader :low_3gp, SerialsUploader
  mount_uploader :mp4_320, SerialsUploader
  mount_uploader :mp4_640, SerialsUploader

  validates_presence_of :number, message: '^ Нужно указать номер серии'

  scope :latest, order("number DESC")
  scope :fresh, order("created_at DESC")
end
