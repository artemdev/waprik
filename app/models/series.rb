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
#  vk           :boolean
#

class Series < ActiveRecord::Base
  default_scope order("created_at DESC")

  VK_SERIALS_PUBLIC_ID = "-27786322"
  attr_accessible :name, :release_date, :number, :files_attributes, :season_attributes, :serial_id
  attr_accessor :ftp_mp4_320, :ftp_mp4_640, :ftp_low_3gp

  has_many :files, class_name: "SerialSerieFile", foreign_key: "serie_id", dependent: :destroy
  has_one :season, class_name: "SerialSeason", foreign_key: "serial_serie_id"
  belongs_to :serial

  accepts_nested_attributes_for :files
  accepts_nested_attributes_for :season

  def post_to_vk_from user
    vk = VkontakteApi::Client.new(user.vk_access_token)
    # загрузить cover в vk
    # 1 ...
    # 2 ...
    # 3 ...
    # отправить в vk
    vk.wall.post(owner_id: VK_SERIALS_PUBLIC_ID, message: self.serial.title, from_group: 1, attachments: Rails.application.routes.url_helpers.serial_url(self.serial, host: 't.waprik.ru'))
    self.vk = true
    save
  end


end
