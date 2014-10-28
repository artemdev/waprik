# == Schema Information
#
# Table name: series
#
#  id           :integer          not null, primary key
#  serial_id    :integer
#  name         :string(255)
#  release_date :string(255)
#  number       :integer
#  mp4_640      :string(255)
#  dl_mp4_640   :integer          default(0)
#  mp4_320      :string(255)
#  dl_mp4_320   :integer          default(0)
#  low_3gp      :string(255)
#  dl_low_3gp   :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Series < ActiveRecord::Base
  attr_accessible :name, :release_date, :number, :files_attributes, :season_attributes
  attr_accessor :ftp_mp4_320, :ftp_mp4_640, :ftp_low_3gp

  belongs_to :serial
  has_many :files, class_name: "SerialSerieFile", foreign_key: "serie_id", dependent: :destroy
  has_one :season, class_name: "SerialSeason", foreign_key: "serial_serie_id"

  accepts_nested_attributes_for :files
  accepts_nested_attributes_for :season

  mount_uploader :low_3gp, SerialsUploader
  mount_uploader :mp4_320, SerialsUploader
  mount_uploader :mp4_640, SerialsUploader

  validates_presence_of :number, message: '^ Нужно указать номер серии'

  scope :latest, order("number DESC")
  scope :fresh, order("created_at DESC")


end
